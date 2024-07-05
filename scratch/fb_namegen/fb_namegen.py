import json
import os
import random
import warnings
import argparse

FILEPATH = "./data.json"

# TODO: remove this line before use
os.chdir(r'D:\Projects\notes\scratch\fb_namegen')

def load_json(filepath):
    with open(filepath, 'r') as file:
        data = json.load(file)
    return data



class Name():
    def __init__(self) -> None:
        data = load_json(FILEPATH)
        self.adverb_probability = data['adverb_probability']
        self.adverbs = data['adverbs']
        self.adjectives = data['adjectives']
        self.nouns = data['nouns']
        self.adverb_weights = [data['default_weight'] for word in self.adverbs]
        self.adjective_weights = [data['default_weight'] for word in self.adjectives]
        self.noun_weights = [data['default_weight'] for word in self.nouns]
        self._apply_custom_weights(data['custom_weights'].items())

    def _apply_custom_weights(self, weights):
        for word, weight in weights:
            if word in self.adverbs:
                idx = self.adverbs.index(word)
                self.adverb_weights[idx] = weight
            elif word in self.adjectives:
                idx = self.adjectives.index(word)
                self.adjective_weights[idx] = weight
            elif word in self.nouns:
                idx = self.nouns.index(word)
                self.noun_weights[idx] = weight
            else:
                warnings.warn(f'"{word}" not found in data. Does case and spelling match?')

    def generate(self, n_generations=1):
        adverbs = random.choices(self.adverbs, self.adverb_weights, k=n_generations)
        adjectives = random.choices(self.adjectives, self.adjective_weights, k=n_generations)
        nouns = random.choices(self.nouns, self.noun_weights, k=n_generations)
        
        names = []
        for n in range(n_generations):
            adverb = adverbs[n]+' ' if random.random() < self.adverb_probability else ''
            adjective = adjectives[n]+' '
            noun = nouns[n]
            name = f'The {adverb}{adjective}{noun}'
            names.append(name)
        
        return names



def main():
    parser = argparse.ArgumentParser(description="Generate random names.")
    parser.add_argument("-n", "--number", type=int, default=1, help="Number of names to generate.")
    parser.add_argument("-f", "--file", type=str, default=FILEPATH, help="Path to the JSON configuration file.")
    args = parser.parse_args()

    name_generator = Name()
    names = name_generator.generate(args.number)
    for name in names:
        print(name)


if __name__ == "__main__":
    main()