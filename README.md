> [!CAUTION]
> This repository is deprecated and no longer maintained.

= Funktional

## Deprecated:

Back in the days when controller specs were a good idea and Rspec wasn't all
mighty, there was a little testing framework that could.

Rspec has added many great features over the years. Although I really enjoyed
coding this, request specs are a superior solution.

## A Rails testing framework with a railsy syntax

## Install
*   Via the gem
        gem install funktional

*   add a setup line to 'test/test_helper.rb'

        class ActiveSupport::TestCase
          setup :funktional
        end

Done!

## For extra flavour, add:
    * should_pricot (Hpricot matchers in Test::Unit)
    * hash_factory (Super simple factories for your tests)
    * matchy (RSpec matchers in Test::Unit)

## Contexts

Contexts, Don't Repeat Yourself, share common setup steps between your tests.

    context "On a hot summer day" do
      before { day :hot }

      context "in the middle of July" do
        before { Time.now = 'July 15' }

        should "be on the beach" do
          assert_equal 'beach', @me.location
        end
      end
    end

Copyright (c) 2009 [Brent Greeff], released under the MIT license
