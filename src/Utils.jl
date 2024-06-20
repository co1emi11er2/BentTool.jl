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


convert_ft(x::Real) = x * ft
convert_ft(x::String) = parse(Float64, x) * ft
function convert_ft(x) 
    ErrorException("Incorrect Type. Expected float, int, or string, got $(typeof(x))")
end