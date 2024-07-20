"""
    sequence(rows::Int, columns::Int, start=1.0, step=1.0)

The sequence function allows you to generate a list of sequential numbers in an array, such as 1, 2, 3, 4.

# Parameters
- `rows`::Int - number of rows in the matrix
- `columns`::Int - number of columns in the matrix
- `start` - starting point of sequence
- `step` - stepping increment in sequence
"""
function sequence(rows::Int, columns::Int, start=1.0, step=1.0)
    # initialize array and step through
    a = ones(Float64, rows, columns) * start
    iter = 0.0 * start
    for row in 1:rows
        for column in 1:columns
            a[row, column] += iter
            iter += step
        end
    end

    return a
end


"""
    sequence(rows::Int, start=1.0, step=1.0)

The sequence function allows you to generate a list of sequential numbers in an array, such as 1, 2, 3, 4.

# Parameters
- `rows`::Int - number of rows in the matrix
- `start` - starting point of sequence
- `step` - stepping increment in sequence
"""
function sequence(rows::Int, start=1.0, step=1.0)
    # initialize array and step through
    a = ones(Float64, rows) * start
    iter = 0.0 * start
    for row in 1:rows
        a[row] += iter
        iter += step
    end

    return a
end

# TODO: FIX Sequence!!!
"""
    eq_spa(n::Int, spa)

Generates a vector of n with values of spa

# Parameters
- `n`::Int - number of spaces
- `spa` - spacing
"""
function eq_spa(n::Int, spa)
    return sequence(n, spa, zero(typeof(spa)))
end

"""
    import_data(lookup_value, lookup_col_name::Symbol, data_location::String)

Searches the specified data location and filters for the first row of data found where
the value in the column specified is equal to the lookup value.

# Parameters
- `lookup_value` - The value to search for
- `lookup_col_name`::Symbol - the column name to search in
- `csv_file_name`::String - The name of csv file in the data directory
"""
function import_data(lookup_value, lookup_col_name::Symbol, csv_file_name::String)
    df = CSV.read(datadir(csv_file_name), DataFrame)

    data = @chain df begin
        @subset($lookup_col_name .== lookup_value)
        first
    end
    return data
end

"""
    custom_show(x)

Custom show function for structs
"""
function custom_show(io, x)
    t = typeof(x)
    s = string(t)
    for field in fieldnames(t)
        s *= string("\n", "  ", field, ": ",  getfield(x, field))
    end
    return print(io, s)
end

"""
    check_spa(n, spa)

Checks to see if spacing and number of items are in agreement.
"""
function check_spa(n, spa)

    # check n is a correct number
    if n <=0
        error("number of items must be greater than or equal to 1. Got $(n)")
    # check if n match spa
    elseif length(spa) != n
        error(string("spacing entries must equal number of items.",
            "Got length(spacing) = $(length(spa)) ",
            "vs n = $(n)"))
    end

    return Nothing
end