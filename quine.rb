def quine
  "def quine end puts quine() [0, 9] + 10.chr + 34.chr + quine + 34.chr + 10.chr + quine() [10, 3] + 10.chr + quine() [14, 110]"
end
puts quine() [0, 9] + 10.chr + 34.chr + quine + 34.chr + 10.chr + quine() [10, 3] + 10.chr + quine() [14, 110]
