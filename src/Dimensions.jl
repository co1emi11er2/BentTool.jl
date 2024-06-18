
"""
    find_middle(xs::AbstractArray{T}) where T

Compute the middle of an array `xs` for each column, which consists of finding its extrema and then computing their mean.

# Example
```julia
julia> a = [
       1 2 3
       4 5 6
       7 8 9
       ]
3×3 Matrix{Int64}:
 1  2  3
 4  5  6
 7  8  9

julia> find_middle(a)
3-element Vector{Int64}:
 4
 5
 6

```
"""
function find_middle(xs::Vector{T}) where T
    # initialize vector and step through columns to find middle
    n_cols = size(xs, 2)
    middle_xs = zeros(T, n_cols)
    for i in 1:n_cols
        middle_xs[i] = middle(xs[:, i])
    end

    return middle_xs
end

function find_middle(xs::Vector{Vector{T}}) where T
    # initialize vector and step through columns to find middle
    n_cols = length(xs)
    middle_xs = zeros(T, n_cols)
    for i in 1:n_cols
        middle_xs[i] = middle(xs[i])
    end

    return middle_xs
end


"""
    find_middle(xs::AbstractArray{T}, ys::AbstractArray{S}) where T where S

Compute the middle of an array `xs` and `ys` for each column, which consists of finding its extrema and then computing their mean. 
Will return two vectors for each array.
"""
function find_middle(xs::AbstractArray{T}, ys::AbstractArray{S}) where T where S
    # check if xs and ys have the same dimension
    if size(xs, 2) != size(ys, 2)
        error("Number of columns in xs must be equal to number of columns in ys")
    end

    # initialize vectors and step through columns to find middle
    n_cols = size(xs, 2)
    middle_xs = zeros(T, n_cols)
    middle_ys = zeros(S, n_cols)
    for i in 1:n_cols
        middle_xs[i] = middle(xs[:, i])
        middle_ys[i] = middle(ys[:, i])
    end

    return middle_xs, middle_ys
end


"""
    find_spacing(xs::AbstractVector{T}) where T

Compute the spacing of a vector `xs`, which consists of computing the difference between adjacent values in the vector.

# Example
```julia
julia> a = [1; 3; 7; 20; 30]
5-element Vector{Int64}:
  1
  3
  7
 20
 30

julia> find_spacing(a)
4-element Vector{Int64}:
  2
  4
 13
 10

```
"""
function find_spacing(xs::AbstractVector{T}) where T
    # check if length of vector is more than 1
    if length(xs) == 1
        error("Vector must have a length greater than 1")
    end

    # initialize vector and step through
    len = length(xs) - 1
    result = zeros(T, len)
    for i in 1:len
        result[i] = xs[i+1] - xs[i]
    end

    return result
end


"""
    find_midpoints(xs::AbstractVector{T}) where T

Compute the midpoints of a vector `xs`, which consists of computing the average between adjacent values in the vector.

# Example
```julia
julia> a = [10; 20; 30; 40; 50]
5-element Vector{Int64}:
 10
 20
 30
 40
 50

julia> find_midpoints(a)
4-element Vector{Int64}:
 15
 25
 35
 45

```
"""
function find_midpoints(xs::AbstractVector{T}) where T
    # check if length of vector is more than 1
    if length(xs) == 1
        error("Vector must have a length greater than 1")
    end

    # initialize vector and step through
    len = length(xs) - 1
    result = zeros(T, len)
    for i in 1:len
        result[i] = (xs[i+1] + xs[i])/2
    end

    return result
end


"""
    plot_h_dimensions!(
    xs::AbstractArray{T}, 
    ys::AbstractArray{S}; 
    error = 1, # yerror bar length (both sides)
    lc = :grey, # line color
    offset = zero(S), # offset in y direction
    ) where T where S

Plots the dimensions of a linearly spaced set of objects with points `xs` and `ys`. 
Each column in `xs` and `ys` represents a new object.
"""
function plot_h_dimensions!(
    xs::Vector{Vector{T}}, 
    ys::Vector{Vector{S}}; 
    error = 1, 
    lc = :grey, 
    offset = zero(S),
    ) where T where S

    # plot dimension lines
    x_dims, y_dims = middle.(xs), middle.(ys)
    y_dims = y_dims .+ offset
    plot!(x_dims, y_dims; yerror=error, lc, ms=0inch, mc=lc)

    # plot annotations
    fntcm = "Courier"
    fntsz = 4
    x_lbls = find_midpoints(x_dims)
    y_lbls = find_midpoints(y_dims)
    spa = round.(T, find_spacing(x_dims), digits=2)
    annos = string.(spa)
    n = length.(annos)
    blanks = vcat("█".^n #=.* "█"=#)
    annotate!(x_lbls, y_lbls, text.(blanks,:white, #=fntcm,=# fntsz))
    annotate!(x_lbls, y_lbls, text.(annos, :grey, #=fntcm,=# fntsz))
end

function plot_h_dimensions_makie!(
    xs::Vector{Vector{T}}, 
    ys::Vector{Vector{S}}; 
    error = 0.02ft, 
    color = :grey, 
    offset = zero(S),
    ) where T where S

    # plot dimension lines
    x_dims, y_dims = middle.(xs), middle.(ys)
    y_dims = y_dims .+ offset
    err = sequence(length(xs), error, 0.0ft)
    lines!(x_dims, y_dims; color, linewidth=1)
    errorbars!(x_dims, y_dims, err; color, linewidth=1)

    # plot annotations
    fntcm = "Courier"
    fntsz = 4
    x_lbls = find_midpoints(x_dims)
    y_lbls = find_midpoints(y_dims)
    spa = round.(T, find_spacing(x_dims), digits=2)
    annos = string.(spa)
    n = length.(annos)
    blanks = vcat("█".^n #=.* "█"=#)
    text!(x_lbls, y_lbls; text=blanks, color=:white, align=(:center, :center))
    text!(x_lbls, y_lbls; text=annos, color, align=(:center, :center))
end

