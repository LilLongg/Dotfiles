function pip --wraps="uv pip" --description="alias --save pip='uv pip'"
    uv pip $argv
end
