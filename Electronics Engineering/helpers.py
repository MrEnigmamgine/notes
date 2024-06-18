import math
import cmath
from matplotlib.ticker import EngFormatter

# I usally wind up creating this object, so I'm placing it here.
engFormat = EngFormatter()

class si :
    """
    This is a simple class that provides an easy way to access the engineering prefixes for the metric system.
    Example:
        25*si.k results in 25_000
    """
    Y = 10**24  # Yotta
    Z = 10**21  # Zetta
    E = 10**18  # Exa
    P = 10**15  # Peta
    T = 10**12  # Tera
    G = 10**9   # Giga
    M = 10**6   # Mega
    k = 10**3   # kilo

    m = 10**-3  # milli
    u = 10**-6  # micro
    µ = 10**-6  # micro
    n = 10**-9  # nano
    p = 10**-12 # pico
    f = 10**-15 # femto
    a = 10**-18 # atto
    z = 10**-21 # zepto
    y = 10**-24 # yocto

def recipsumrecip(data):
    """Returns the reciprocal of the sum of reciprocals. (Eg. For calculating parallel resistances)"""
    denom = 0
    for n in data:
        denom += 1/n
    return 1/denom

def polar_format(complex_number):
    magnitude, radians = cmath.polar(complex_number)
    degrees = math.degrees(radians)
    return (magnitude,degrees)

def num_to_vect(n):
    """Returns a tuple vector from a real or complex number."""
    x = n.real
    y = n.imag
    return (x,y)

def vect_to_num(vect):
    """Returns a tuple vector from a real or complex number."""
    n = complex(vect[0],vect[1])
    return (n)

def two_pi(n):
    """Multiplies a number by 2*pi"""
    return 2*math.pi*n

def over_sqrt_2(n):
    """Divides a number by the square root of two"""
    return n/math.sqrt(2)

def get_inductive_reactance(inductance,frequency):
    """
    Returns a complex number representing the impedance vector of an inductive reactance.
    Variables:
      inductance: The inductance measured in Hernies
      frequency: The frequency measured in Hertz
    """
    period = 2*math.pi
    omega = period*frequency
    Xl = omega*inductance
    return complex(0,Xl)

def get_capacitive_reactance(capacitance,frequency):
    """
    Returns a complex number representing the impedance vector of an capacitive reactance.
    Variables:
      capacitance: The capacitance measured in Farads
      frequency: The frequency measured in Hertz
    """
    period = 2*math.pi
    omega = period*frequency
    Xc = 1/(omega*capacitance)
    return complex(0,-Xc)

####
##  LC Formulae
####

def get_resonant_frequency(capacitance,inductance):
    period = 2*math.pi
    f = 1/(period*math.sqrt(capacitance*inductance))
    return f

def get_exact_resonant_frequency(Rwinding,inductance,capacitance):
    # Denominator is the same as the inexact formula
    res_freq = get_resonant_frequency(inductance,capacitance)
    # A fancy numerater accounts for winding resistance
    numerator = math.sqrt(1-Rwinding**2*(capacitance/inductance))
    exact_freq = numerator*res_freq
    return exact_freq

def get_cutoff_freq_inductive(inductance,resistance):
    return 1/two_pi(inductance/resistance)

def get_cutoff_freq_capacitive(capacitance,resistance):
    return 1/two_pi(capacitance*resistance)

def get_bandwidth(Rwinding,inductance,capacitance):
    inductive_reactance = inductance/(math.sqrt(inductance*capacitance))
    quality_factor = inductive_reactance/Rwinding
    resonant_frequency = get_exact_resonant_frequency(Rwinding,inductance,capacitance)
    bandwidth = resonant_frequency/quality_factor
    return bandwidth
