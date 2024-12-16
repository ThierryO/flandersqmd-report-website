function is_empty(s)
  return s == nil or s == ''
end

return {
  {
    Meta = function(meta)
      if not is_empty(meta.flandersqmd) then
      end
      return meta
    end
  }
}
