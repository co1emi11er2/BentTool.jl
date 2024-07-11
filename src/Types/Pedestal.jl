# ----------------
# PEDESTAL
# ----------------

@with_kw struct Pedestal
    width::float_inch
    height::float_inch = 1.5inch

    function Pedestal(width, height)
        new(
            width   |> to_inch,
            height  |> to_inch,
        )
    end
end