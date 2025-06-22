# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table #Design #Trie
# #LeetCode_75_Trie #Level_2_Day_16_Design #Udemy_Trie_and_Heap #Top_Interview_150_Trie
# #Big_O_Time_O(word.length())_or_O(prefix.length())_Space_O(N)
# #2024_08_03_Time_724_ms_(100.00%)_Space_108.6_MB_(100.00%)

defmodule Trie do
  use GenServer

  @spec init_() :: any
  def init_() do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
    GenServer.call(__MODULE__, :start)
  end

  @spec insert(word :: String.t) :: any
  def insert(word) do
    GenServer.call(__MODULE__, {:insert, word})
  end

  @spec search(word :: String.t) :: boolean
  def search(word) do
    GenServer.call(__MODULE__, {:search, word})
  end

  @spec starts_with(prefix :: String.t) :: boolean
  def starts_with(prefix) do
    GenServer.call(__MODULE__, {:prefix, prefix})
  end

  @impl true
  def init(_) do
    {:ok, nil}
  end

  @impl true
  def handle_call(:start, _, _) do
    {:reply, nil, Map.new()}
  end

  def handle_call({:insert, word}, _, map) do
    String.codepoints(word)
    |> Enum.reduce({map, ""}, fn ch, {map, prefix} ->
      {Map.put_new(map, prefix, false), prefix <> ch}
    end)
    |> elem(0)
    |> Map.put(word, true)
    |> then(fn map -> {:reply, nil, map} end)
  end

  def handle_call({:search, word}, _, map) do
    {:reply, Map.get(map, word, false), map}
  end

  def handle_call({:prefix, prefix}, _, map) do
    {:reply, Map.get(map, prefix) != nil, map}
  end
end
