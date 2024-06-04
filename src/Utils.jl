function sequence(rows::Int, columns::Int=1, start=1.0, step=1.0)
    a = ones(Float64, rows, columns) * start
    iter = 0.0 * start
    for row in 1:rows
        for column in 1:columns
            a[row, column] += iter
            iter += step
        end
    end
    a
end
