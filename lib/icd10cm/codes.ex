defmodule Icd10cm.Codes do
  @moduledoc """
  The Codes context.
  """

  import Ecto.Query, warn: false
  alias Icd10cm.Repo

  alias Icd10cm.Codes.Icd10clinical

  @doc """
  Returns the list of icd10clinicals.

  ## Examples

      iex> list_icd10clinicals()
      [%Icd10clinical{}, ...]

  """



  @doc """
  Gets a single icd10clinical.

  Raises `Ecto.NoResultsError` if the Icd10clinical does not exist.

  ## Examples

      iex> get_icd10clinical!(123)
      %Icd10clinical{}

      iex> get_icd10clinical!(456)
      ** (Ecto.NoResultsError)

  """
  def get_icd10clinical!(id), do: Repo.get!(Icd10clinical, id)

  @doc """
  Creates a icd10clinical.

  ## Examples

      iex> create_icd10clinical(%{field: value})
      {:ok, %Icd10clinical{}}

      iex> create_icd10clinical(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_icd10clinical(attrs \\ %{}) do
    %Icd10clinical{}
    |> Icd10clinical.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a icd10clinical.

  ## Examples

      iex> update_icd10clinical(icd10clinical, %{field: new_value})
      {:ok, %Icd10clinical{}}

      iex> update_icd10clinical(icd10clinical, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_icd10clinical(%Icd10clinical{} = icd10clinical, attrs) do
    icd10clinical
    |> Icd10clinical.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a icd10clinical.

  ## Examples

      iex> delete_icd10clinical(icd10clinical)
      {:ok, %Icd10clinical{}}

      iex> delete_icd10clinical(icd10clinical)
      {:error, %Ecto.Changeset{}}

  """
  def delete_icd10clinical(%Icd10clinical{} = icd10clinical) do
    Repo.delete(icd10clinical)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking icd10clinical changes.

  ## Examples

      iex> change_icd10clinical(icd10clinical)
      %Ecto.Changeset{data: %Icd10clinical{}}

  """
  def change_icd10clinical(%Icd10clinical{} = icd10clinical, attrs \\ %{}) do
    Icd10clinical.changeset(icd10clinical, attrs)
  end


  def list_icd10clinicals(_params) do
    _page =
     Icd10clinical
     |> order_by([p], [p.icd10cm_code_2])
  end
###########################3
 def format_column(text) do

result =   String.split(text, "^")

corrected = List.delete_at(result, 0)

format_result =
 Enum.map(corrected,  fn item ->
   "<td>"
   <> item
   <> "</td>"
  end)

  l_format = List.to_string(format_result)

  _form = "<table class='table responsive hover stack table-scroll'>"
  <> "<tr style='background-color:#edf8e9;'>"
  <> l_format
  <> "</tr>"
  <> "</table>"

end
#################33
def search_clinicals(query, selection) do
  case selection do
    "codes" -> search_icd10clinicals_codes(query)
    "long_desc" -> search_icd10clinicals_long_desc(query)
    _ -> ""
  end
end
######################
def search_icd10clinicals_codes(query) do
  _query =
  from(
    p in Icd10clinical,
    where: ilike(p.icd10cm_code_2, ^"#{query}%"),
    limit: 250,
    order_by: [asc: p.icd10cm_code_2]
  )

end
#######################################
def search_icd10clinicals_long_desc(query) do

  from(
      d in Icd10clinical,
      where: fragment("(?) @@ plainto_tsquery(?)", d.long_description_tsv, ^query),
      #or  where: ilike(d.long_description, ^"#{query}%"),
      order_by: [asc: d.long_description]
    )


end
####################


  alias Icd10cm.Codes.Icd10cm_neoplasm

  @doc """
  Returns the list of icd10cm_neoplasms.

  ## Examples

      iex> list_icd10cm_neoplasms()
      [%Icd10cm_neoplasm{}, ...]

  """
  def list_icd10cm_neoplasms do
    Repo.all(Icd10cm_neoplasm)
  end

  @doc """
  Gets a single icd10cm_neoplasm.

  Raises `Ecto.NoResultsError` if the Icd10cm neoplasm does not exist.

  ## Examples

      iex> get_icd10cm_neoplasm!(123)
      %Icd10cm_neoplasm{}

      iex> get_icd10cm_neoplasm!(456)
      ** (Ecto.NoResultsError)

  """
  def get_icd10cm_neoplasm!(id), do: Repo.get!(Icd10cm_neoplasm, id)

  @doc """
  Creates a icd10cm_neoplasm.

  ## Examples

      iex> create_icd10cm_neoplasm(%{field: value})
      {:ok, %Icd10cm_neoplasm{}}

      iex> create_icd10cm_neoplasm(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_icd10cm_neoplasm(attrs \\ %{}) do
    %Icd10cm_neoplasm{}
    |> Icd10cm_neoplasm.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a icd10cm_neoplasm.

  ## Examples

      iex> update_icd10cm_neoplasm(icd10cm_neoplasm, %{field: new_value})
      {:ok, %Icd10cm_neoplasm{}}

      iex> update_icd10cm_neoplasm(icd10cm_neoplasm, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_icd10cm_neoplasm(%Icd10cm_neoplasm{} = icd10cm_neoplasm, attrs) do
    icd10cm_neoplasm
    |> Icd10cm_neoplasm.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a icd10cm_neoplasm.

  ## Examples

      iex> delete_icd10cm_neoplasm(icd10cm_neoplasm)
      {:ok, %Icd10cm_neoplasm{}}

      iex> delete_icd10cm_neoplasm(icd10cm_neoplasm)
      {:error, %Ecto.Changeset{}}

  """
  def delete_icd10cm_neoplasm(%Icd10cm_neoplasm{} = icd10cm_neoplasm) do
    Repo.delete(icd10cm_neoplasm)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking icd10cm_neoplasm changes.

  ## Examples

      iex> change_icd10cm_neoplasm(icd10cm_neoplasm)
      %Ecto.Changeset{data: %Icd10cm_neoplasm{}}

  """
  def change_icd10cm_neoplasm(%Icd10cm_neoplasm{} = icd10cm_neoplasm, attrs \\ %{}) do
    Icd10cm_neoplasm.changeset(icd10cm_neoplasm, attrs)
  end
#####################
def list_icd10cm_neoplasms(_params) do
   _page =
    Icd10cm_neoplasm
    |> order_by([p], [p.title])
  end
  ###########################
  def get_neoplasm_title(term) do
    main_term_q =
    (from p in Icd10cm_neoplasm,
    order_by: [asc: p.title],
    where: p.title ==   ^("#{term}"),
    # where: fragment("(?) @@ plainto_tsquery(?)", p.title,   ^("#{term}%")  ),
    select: %{main_term: fragment("? ", p.main_term),
              title: fragment(" ? ",  p.title)
    },
    limit: 10
    )

    records_b =  main_term_q |> Repo.all
  end
#############################3
@doc """
Mal Primary = "0.term_cell_l.0.cell_code" => "C41.2",
Mal Secondary "0.term_cell_l.1.cell_code" => "C79.51",
IN Situ "0.term_cell_l.2.cell_code" => "-",
Benign "0.term_cell_l.3.cell_code" => "D16.6",
 Uncertain Beh  "0.term_cell_l.4.cell_code" => "D48.0",
Unspecified Beh. "0.term_cell_l.5.cell_code" => "D49.2",


  """
def find_neoplasm_code(term, code_order) do
  records_b = get_neoplasm_title(term)

  if Enum.any?(records_b) do
   Enum.map(records_b, fn(rec) ->
     main_term_rec = rec[:main_term]

     IO.inspect main_term_rec
     case code_order do
      "primary" ->
       code  = main_term_rec["0.term_cell_l.0.cell_code"]
       if( code !== nil) do
        code
    else
       "None"
   end
        "secondary" ->
        code = main_term_rec["0.term_cell_l.1.cell_code"]
        if( code !== nil) do
          code
      else
         "None"
     end
     "in_situ" ->
      code = main_term_rec["0.term_cell_l.2.cell_code"]
      if( code !== nil) do
        code
    else
       "None"
   end
   "benign" ->
    code = main_term_rec["0.term_cell_l.3.cell_code"]
    if( code !== nil) do
      code
  else
     "None"
 end
 "uncetain" ->
  code = main_term_rec["0.term_cell_l.4.cell_code"]
  if( code !== nil) do
    code
else
   "None"
end
"unspecified" ->
  code = main_term_rec["0.term_cell_l.5.cell_code"]
  if( code !== nil) do
    code
else
   "None"
end
    _ ->
      " "
  end # case

    end )
    #IO.inspect  primary_code
  end


end
########################



#################3
end
