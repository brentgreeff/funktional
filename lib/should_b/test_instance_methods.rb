module ShouldB
  
  module TestInstanceMethods
    def should(params, &block)
      method = "should_#{params.keys.first}".to_sym
      args = params.values.first
      self.send method, args, &block
    end
    
    def should_not(params, &block)
      if params.is_a? Hash
        method = "should_not_#{params.keys.first}".to_sym
        args = params.values.first
      else
        method = "should_not_#{params}".to_sym
        args = nil
      end
      self.send method, args, &block
    end
    
    def flashed(symbol)
       FlashedAssertion.new(symbol)
    end
    
    def assigned(klass)
      AssignedAssertion.new(klass)
    end
    
    private
    
    def should_send_email(details)
      EmailAssertion.new(details)
    end
    
    def should_not_send_email(going_to_be_nil = nil)
      before_count = ActionMailer::Base.deliveries.size
      yield
      after_count = ActionMailer::Base.deliveries.size
      assert_equal before_count, after_count, "Email was sent"
    end
    
    def should_render(template)
      assert_response :success
      assert_template template
    end
    
    def should_render_404(template = 'public/404')
      assert_response :not_found
      assert_template template
    end
    
    def should_assign_new(klass_or_symbol)
      if klass_or_symbol.is_a? Symbol
        symbol = klass_or_symbol
        
        assert_not_nil assigns(symbol), "No [:#{symbol}] assigned"
        assert assigns(symbol).new_record?, "[:#{symbol}] is not a new record"
      else
        klass = klass_or_symbol
        symbol = klass.to_s.tableize.singularize.to_sym
        
        assert_not_nil assigns(symbol), "No [#{symbol}] assigned"
        assert assigns(symbol).new_record?, "[#{klass}] is not a new record"
        assert assigns(symbol).is_a?(klass), "assigned [#{symbol}] is not a [#{klass}]"
      end
    end
    
    def should_redirect_to(uri)
      assert_response :redirect
      assert_redirected_to uri
    end
    
    def should_respond(expected_response)
      assert_response :not_found
      assert_template 'public/404'
    end
    
    # Delete
    
    def should_delete(klass)
      before_count = klass.count
      expected_count = before_count - 1
      yield
      assert_equal expected_count, klass.count, "A [#{klass}] was not deleted"
    end
    
    def should_not_delete(klass)
      expected_count = klass.count
      yield
      assert_equal expected_count, klass.count, "A [#{klass}] was deleted"
    end
    
    # Create
    
    def should_create(klass)
      before_count = klass.count
      expected_count = before_count + 1
      yield
      assert_equal expected_count, klass.count, "New [#{klass}] was not created"
    end
    
    def should_not_create(klass)
      expected_count = klass.count
      yield
      assert_equal expected_count, klass.count, "New [#{klass}] was created"
    end
  end
end
