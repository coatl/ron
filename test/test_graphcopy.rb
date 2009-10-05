require 'test/unit'
require 'ron'
require 'ron/graphedge'
require 'pp'

class TestGraphCopy<Test::Unit::TestCase
  inner=["foo",nil]
  TESTDATA=[
    {:one=>inner, :two=>inner, :three=>nil}
  ]

  def test_depth
    TESTDATA.each{|td|
      copy=Ron::GraphWalk::depth_graphcopy(td){|cntr,o,i,ty,useit|
        if :one==i and Ron::GraphEdge::HashValue==ty
          useit[0]=true
          ["bar"]
        elsif "foo"==o
          useit[0]=true
          "baz"
        end
      }
      assert_equal({:three=>nil, :one=>["bar"], :two=>["baz", nil]}, copy)
    }
  end

  def test_breadth
    TESTDATA.each{|td|
      copy=Ron::GraphWalk::breadth_graphcopy(td){|cntr,o,i,ty,useit|
        if :one==i and Ron::GraphEdge::HashValue==ty
          useit[0]=true
          ["bar"]
        elsif "foo"==o
          useit[0]=true
          "baz"
        end
      }
      assert_equal({:three=>nil, :one=>["baz", nil], :two=>["baz", nil]}, copy)
      #?? is that really the right output ??
    }
  end
end
