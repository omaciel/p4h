Facter.add("customer") do
  setcode do
    kernel_release = Facter::Util::Resolution.exec('/usr/bin/uname -r')
    # Get version
    if kernel_release =~ /^3.2/
      answer = "Latest Kernel"
    elsif kernel_release =~ /^3.0/
      answer = "3.0 Kernel"
    elsif kernel_release =~ /^2.6/
      answer = "Decent Kernel"
    else
      answer = "Unknown Kernel"
    end
    if answer =~ /ipv6/
      answer += " with IPV6 Support"
    else
      answer += " without IPV6 Support"
    end
  end
end
