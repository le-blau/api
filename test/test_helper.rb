ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

# gem minitest-reporters
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # 並列テスト
  # プロセスが分岐した直後に呼び出し
  parallelize_setup do |worker|
    # seedデータをテストデータとして読み込み
    load "#{Rails.root}/db/seeds.rb"
  end

  # Run tests in parallel with specified workers
  # workers: プロセス数を示す（2以上の場合並列テストが有効になる）
  # number_of_processors： 使用しているマシン(Docker)のコア数
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
