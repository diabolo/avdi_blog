require 'coderay'
require 'ruby-debug'

module DebugStepHelper
  # use this when in an actual debugging session
  def peek
    output = CodeRay.scan(page.body, :html).term
    dbg_puts '-- peeking at body'
    dbg_puts output
    dbg_puts '-- end peeking at body'
  end

  # use this in step definitions
  def peek_body
    output = CodeRay.scan(page.body, :html).term
    puts '-- peeking at body'
    puts output
    puts '-- end peeking at body'
  end
end
World(DebugStepHelper)
      
Then 'peek body' do 
  peek_body
end

Then /^pending (.+)/ do |msg|
  pending msg
end

