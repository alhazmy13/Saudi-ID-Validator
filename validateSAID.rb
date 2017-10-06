def check(id)
  id = id.strip
  if !Integer(id)
    return -1
  end
  if id.length != 10
    return -1
  end
  type = Integer(id[0])
  if type != 2 && type != 1
    return -1;
  end
  sum = 0
  for i in 0..9
    if i % 2 == 0
      checkNumber = String(Integer(id[i]) * 2).rjust(2, '0')
      sum += Integer(checkNumber[0]) + Integer(checkNumber[1]);
    else
      sum += Integer(id[i]);
    end
  end
  return -1 if sum%10 !=0 else type
end
