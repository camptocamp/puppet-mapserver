output = %x{proj 2>&1}

if $?.exitstatus and output.match(/Rel\. (\d+\.\d+\.\d+).*/)

  Facter.add("proj_version") do
    setcode do
      $1
    end
  end
end
