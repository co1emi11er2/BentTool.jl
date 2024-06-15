import Statistics: middle



function find_middle(xs::AbstractArray{T}) where T
    n_cols = size(xs, 2)
    middle_xs = zeros(T, n_cols)
    for i in 1:n_cols
        middle_xs[i] = middle(xs[:, i])
    end
    return middle_xs
end

function find_middle(xs::AbstractArray{T}, ys::AbstractArray{S}) where T where S
    if size(xs, 2) != size(ys, 2)
        error("Number of columns in xs must be equal to number of columns in ys")
    end
    n_cols = size(xs, 2)
    middle_xs = zeros(T, n_cols)
    middle_ys = zeros(S, n_cols)
    for i in 1:n_cols
        middle_xs[i] = middle(xs[:, i])
        middle_ys[i] = middle(ys[:, i])
    end
    return middle_xs, middle_ys
end

function find_spacing(xs::AbstractVector{T}) where T
    len = length(xs) - 1
    result = zeros(T, len)
    for i in 1:len
        result[i] = xs[i+1] - xs[i]
    end
    return result
end

function find_label_points(xs::AbstractVector{T}) where T
    len = length(xs) - 1
    result = zeros(T, len)
    for i in 1:len
        result[i] = (xs[i+1] + xs[i])/2
    end
    return result
end

function plot_h_dimensions!(
    xs::AbstractArray{T}, 
    ys::AbstractArray{S}; 
    error = 1, 
    lc = :grey, 
    offset = zero(S),
    ) where T where S

    x_dims, y_dims = find_middle(xs, ys)
    y_dims = y_dims .+ offset
    plot!(x_dims, y_dims; yerror=error, lc, ms=0inch, mc=lc)

    # plot annotations
    fntcm = "Courier"
    fntsz = 4
    x_lbls = find_label_points(x_dims)
    y_lbls = find_label_points(y_dims)
    spa = round.(T, find_spacing(x_dims), digits=2)
    annos = string.(spa)
    n = length.(annos)
    blanks = vcat("█".^n #=.* "█"=#)
    annotate!(x_lbls, y_lbls, text.(blanks,:white, #=fntcm,=# fntsz))
    annotate!(x_lbls, y_lbls, text.(annos, #=fntcm,=# fntsz))
end