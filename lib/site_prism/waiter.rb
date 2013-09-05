module SitePrism::Waiter
  def wait_until_true(wait_seconds=0)
    start_time = Time.now
    loop {
      return true if yield
      break unless Time.now - start_time <= wait_seconds
      sleep(0.05)
    }
    raise TimeoutException.new, "Timed out while waiting for block to return true."
  end

  def self.default_wait_time
    @@default_wait_time
  end

  private

  @@default_wait_time = Capybara.default_wait_time
end