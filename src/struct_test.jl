abstract type Shape end

struct Square <: Shape
    s::Float64
end

struct Rectangle <: Shape
    b::Float64
    w::Float64
end

struct Box{T<:Shape}
    shape::T
    length::Float64
end

shape = Square(5)

box = Box{Square}(shape, 6)

