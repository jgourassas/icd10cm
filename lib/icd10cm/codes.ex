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
def search_neoplasms(query, selection) do
  case selection do
    "title" -> search_icd10cm_neoplasms_title(query)
    "long_desc" -> search_icd10clinicals_long_desc(query)
    _ -> ""
  end
end
####################
def search_icd10cm_neoplasms_title(query) do
  title_q =
  (from p in Icd10cm_neoplasm,
  order_by: [asc: p.title],
  where: p.title ==   ^("#{query}"),
  limit: 10
  )

end
#################3

  alias Icd10cm.Codes.Icd10cm_eindex

  @doc """
  Returns the list of iicd10cm_eindexes.

  ## Examples

      iex> list_iicd10cm_eindexes()
      [%Icd10cm_eindex{}, ...]

  """
  def list_iicd10cm_eindexes do
    Repo.all(Icd10cm_eindex)
  end

  @doc """
  Gets a single icd10cm_eindex.

  Raises `Ecto.NoResultsError` if the Icd10cm eindex does not exist.

  ## Examples

      iex> get_icd10cm_eindex!(123)
      %Icd10cm_eindex{}

      iex> get_icd10cm_eindex!(456)
      ** (Ecto.NoResultsError)

  """
  def get_icd10cm_eindex!(id), do: Repo.get!(Icd10cm_eindex, id)

  @doc """
  Creates a icd10cm_eindex.

  ## Examples

      iex> create_icd10cm_eindex(%{field: value})
      {:ok, %Icd10cm_eindex{}}

      iex> create_icd10cm_eindex(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_icd10cm_eindex(attrs \\ %{}) do
    %Icd10cm_eindex{}
    |> Icd10cm_eindex.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a icd10cm_eindex.

  ## Examples

      iex> update_icd10cm_eindex(icd10cm_eindex, %{field: new_value})
      {:ok, %Icd10cm_eindex{}}

      iex> update_icd10cm_eindex(icd10cm_eindex, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_icd10cm_eindex(%Icd10cm_eindex{} = icd10cm_eindex, attrs) do
    icd10cm_eindex
    |> Icd10cm_eindex.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a icd10cm_eindex.

  ## Examples

      iex> delete_icd10cm_eindex(icd10cm_eindex)
      {:ok, %Icd10cm_eindex{}}

      iex> delete_icd10cm_eindex(icd10cm_eindex)
      {:error, %Ecto.Changeset{}}

  """
  def delete_icd10cm_eindex(%Icd10cm_eindex{} = icd10cm_eindex) do
    Repo.delete(icd10cm_eindex)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking icd10cm_eindex changes.

  ## Examples

      iex> change_icd10cm_eindex(icd10cm_eindex)
      %Ecto.Changeset{data: %Icd10cm_eindex{}}

  """
  def change_icd10cm_eindex(%Icd10cm_eindex{} = icd10cm_eindex, attrs \\ %{}) do
    Icd10cm_eindex.changeset(icd10cm_eindex, attrs)
  end

#####################33
def list_icd10cm_eindexes(_params) do
  _page =
   Icd10cm_eindex
   |> order_by([p], [p.title])
end
#######################################
def find_icd10cm_eindexes_records(q_title) do
_query =
from(
  p in Icd10cm_eindex,
  where: ilike(p.title, ^"#{q_title}%"),
  select: [ p.main_term_jsonb],
  limit: 250
)

_query |>Repo.all()

end
############################################
def make_icd10cm_eindexes_jsonb(title) do

  records = find_icd10cm_eindexes_records(title)


   Enum.map(records, fn(l) ->
   terms_l = Enum.map(l, fn (x) -> x["terms_l"] end)

   main_title = Enum.map(l, fn (x) -> x["main_title"] end)

   main_code = Enum.map(l, fn (x) -> x["main_code"] end)
   main_codes = Enum.map(l, fn (x) -> x["main_codes"] end)
   main_see_probe = Enum.map(l, fn (x) -> x["main_see"] end)
   main_see_codes = Enum.map(l, fn (x) -> x["main_see_codes"] end)
   main_see_tab = Enum.map(l, fn (x) -> x["main_see_tab"] end)
   main_use_probe = Enum.map(l, fn (x) -> x["main_use"] end)



    formated =

        "#{main_code}"
      <> " "
      <> "#{main_codes}"
      <> " "
      <> "#{main_see_probe}"
      <> " "
      <> "#{main_see_codes}"
      <> " "
      <> "#{main_see_tab}"
      <> " "
      <> "#{main_use_probe}"

     #format_jsonb(formated)

 if  Enum.any?(terms_l) do
  Enum.map(terms_l, fn(terms) ->
    Enum.map(terms, fn(a_term) ->
      format_term(a_term)
    end)##a_term
  end)
end #if




  end
  )



end
##################################3
def format_jsonb(key) do

  key

end
####################
def format_term(a_term) do

a = a_term |> Enum.filter(fn {_, v} -> v != "" end)
|> Enum.into(%{})

term_level = a["term_level"]
intend = level_intend(term_level)


term_level = a["term_level"]

term_title = a["term_title"]
term_nemod = a["term_nemod"]
term_codes = a["term_codes"]
term_use_probe = a["term_use"]
term_see_probe = a["term_see"]
term_see_codes = a["term_see_codes"]
term_see_tab  = a["term_see_tab"]
term_code = a["term_code"]

term_use = if "#{term_use_probe}" != "" do
 "<span style='background-color:yellow'>" <>  " use " <> "#{term_use_probe}" <> "</span>"
else
   " "
end

term_see  =  if "#{term_see_probe}" != "" do
  "<span style='color:darkblue'><em>"
    <>  " See " <> "#{term_see_probe}"
    <> "</em></span>"
else
  " "
end

  result =
      intend
      <>  "#{term_title}"
      <> " " <> "#{term_nemod}"
      <> " " <> "#{term_use_probe}"
      <> "  "  <> "<span style='color:#993333;'>"  <> "#{term_code}" <> "</span>"
      <> "  "  <> "#{term_codes}"

      <> "<br/>"

      header =
       "#{term_see_tab}"
       <> "  "  <> "#{term_see_codes}"
       <> "  "  <> "#{term_see}"

       <> "  "  <> "#{term_use}"

      final = header <> result
      #final = "<ul class ='no-bullet'>" <> header <> result <> "</ul>"

end
#######################
def level_intend_old(term_level) do
  intend = case term_level do
             "1" ->
                "- "
             "2" ->
               "-- "
               "3" ->
               "--- "
             "4" ->
               "---- "
               "5" ->
               "----- "
               "6" ->
               "------ "
               "7" ->
               "------- "
               _ ->
               "\t"

           end

end##level_intend
################################
def level_intend(term_level) do
  intend = case term_level do
             "1" ->
               "<span style='margin-left:5px; color:#8EE8D6;'>" <>  "- " <>  "</span>"
             "2" ->
              "<span style='margin-left:20px; color:#80B2FF;'>" <>  "- - " <>  "</span>"
               "3" ->
                "<span style='margin-left:35px; color: #85E085;'>" <>  "- - - " <>  "</span>"
             "4" ->
              "<span style='margin-left:50px;color:#E0FF85;'>" <>  "- - - - " <>  "</span>"
               "5" ->
                "<span style='margin-left:65px;color:#8EE8D6;'>" <>  "- - - - - " <>  "</span>"
               "6" ->
                "<span style='margin-left:80px;color:#FFCACA;'>" <>  "- - - - - - " <>  "</span>"
               "7" ->
                "<span style='margin-left:95px;color:##C2A3FF;'>" <>  "- - - - - - - " <>  "</span>"
               _ ->
               "\t"

           end

end##level_intend


################################

##############3
end
