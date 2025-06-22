# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Stack #Design
# #Data_Structure_II_Day_14_Stack_Queue #Programming_Skills_II_Day_18 #Level_2_Day_16_Design
# #Udemy_Design #Top_Interview_150_Stack #Big_O_Time_O(1)_Space_O(N)
# #2024_08_03_Time_385_ms_(100.00%)_Space_89.9_MB_(100.00%)

defmodule MinStack do
  use GenServer
  
  @spec init_() :: any
  def init_() do
    GenServer.start_link(__MODULE__, nil, [name: __MODULE__])
    GenServer.call(__MODULE__, :init)
  end

  @spec push(val :: integer) :: any
  def push(val) do
    GenServer.call(__MODULE__, {:push, val})
  end

  @spec pop() :: any
  def pop() do
    GenServer.call(__MODULE__, :pop)
  end

  @spec top() :: integer
  def top() do
    GenServer.call(__MODULE__, :top)
  end

  @spec get_min() :: integer
  def get_min() do
    GenServer.call(__MODULE__, :min)
  end

  @impl true
  def init() do
    {:ok, nil}
  end

  @impl true
  def handle_call(:init, _, _) do
    {:reply, nil, []}
  end
  
  def handle_call({:push, val}, _, []) do
    {:reply, nil, [{val, val}]}
  end
  def handle_call({:push, val}, _, [{x, m} | tail]) do
    {:reply, nil, [{val, min(val, m)}, {x, m} | tail]}
  end

  def handle_call(:pop, _, [_ | tail]) do
    {:reply, nil, tail}
  end

  def handle_call(:top, _, list = [{x, _} | _]) do
    {:reply, x, list}
  end

  def handle_call(:min, _, list = [{_, m} | _]) do
    {:reply, m, list}
  end
end

# Your functions will be called as such:
# MinStack.init_()
# MinStack.push(val)
# MinStack.pop()
# param_3 = MinStack.top()
# param_4 = MinStack.get_min()

# MinStack.init_ will be called before every test case, in which you can do some necessary initializations.
