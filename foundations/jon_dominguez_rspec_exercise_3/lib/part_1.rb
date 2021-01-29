def is_prime?(num)
    return false if num < 2
    (2..(num/2)).none? {|n| num % n == 0}
end

def nth_prime(num)
    count = 0
    i = 2
    while count < num
        count += 1 if is_prime?(i)
        i += 1
    end
    i - 1
end

def prime_range(min, max)
    primes = []
    i = min
    while i <= max
        primes << i if is_prime?(i)
        i += 1
    end
    primes
end