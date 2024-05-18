using BentTool
using Documenter

DocMeta.setdocmeta!(BentTool, :DocTestSetup, :(using BentTool); recursive=true)

makedocs(;
    modules=[BentTool],
    authors="Cole Miller",
    sitename="BentTool.jl",
    format=Documenter.HTML(;
        canonical="https://co1emi11er2.github.io/BentTool.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/co1emi11er2/BentTool.jl",
    devbranch="main",
)
