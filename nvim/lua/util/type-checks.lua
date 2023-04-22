function IsFunction(var)
  return type(var) == type(function()
  end)
end

function IsString(var)
  return type(var) == type("")
end

function IsNumber(var)
  return type(var) == type(0)
end

function IsTable(var)
  return type(var) == type({})
end

function IsFloat(var)
  return type(var) == type(0.0)
end

function IsEmptyTable(var)
  local num_entries = 0
  for _ in var do
    num_entries = num_entries + 1
  end
  return IsTable(var) and num_entries == 0
end
