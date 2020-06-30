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

  ########################### 3
  def format_column(text) do
    result = String.split(text, "^")

    corrected = List.delete_at(result, 0)

    format_result =
      Enum.map(corrected, fn item ->
        "<td>" <>
          item <>
          "</td>"
      end)

    l_format = List.to_string(format_result)

    _form =
      "<table class='table responsive hover stack table-scroll'>" <>
        "<tr style='background-color:#edf8e9;'>" <>
        l_format <>
        "</tr>" <>
        "</table>"
  end

  #################


  ####################
  def search_clinicals(query, selection ) do
    case selection do
      "codes" -> search_icd10clinicals_codes(query)
      "long_desc" -> search_icd10clinicals_long_desc(query)
      "includes" -> search_icd10clinicals_includes(query)
      "inclusionterm"-> search_icd10clinicals_inclusionterm(query)
      "excludes1"-> search_icd10clinicals_excludes1(query)
      "excludes2"-> search_icd10clinicals_excludes2(query)
      "codefirst" -> search_icd10clinicals_codefirst(query)
      "codealso" -> search_icd10clinicals_codealso(query)
      "useadditionalcode" -> search_icd10clinicals_useadditionalcode(query)
      _ -> ""
    end
  end
 ######################
 def search_icd10clinicals_useadditionalcode(code_2) do

  query =
    from(
     p in Icd10clinical,
      where: p.icd10cm_code_2 ==  ^"#{code_2}",
      select: [p.useadditionalcode],
      order_by: [asc: p.icd10cm_code_2] )

      res = Repo.all(query)
      str_split = List.to_string(res)
end

 ######################

 def search_icd10clinicals_codealso(code_2) do

  query =
    from(
     p in Icd10clinical,
      where: p.icd10cm_code_2 ==  ^"#{code_2}",
      select: [p.codealso],
      order_by: [asc: p.icd10cm_code_2] )

      res = Repo.all(query)
      str_split = List.to_string(res)
end

 ######################
 def search_icd10clinicals_codefirst(code_2) do

  query =
    from(
     p in Icd10clinical,
      where: p.icd10cm_code_2 ==  ^"#{code_2}",
      select: [p.codefirst],
      order_by: [asc: p.icd10cm_code_2] )

      res = Repo.all(query)
      str_split = List.to_string(res)

  end
 ######################
 def search_icd10clinicals_excludes2(code_2) do

  query =
    from(
     p in Icd10clinical,
      where: p.icd10cm_code_2 ==  ^"#{code_2}",
      select: [p.excludes2],
      order_by: [asc: p.icd10cm_code_2] )

      res = Repo.all(query)
      str_split = List.to_string(res)

  end
#########################

 def search_icd10clinicals_excludes1(code_2) do

  query =
    from(
     p in Icd10clinical,
      where: p.icd10cm_code_2 ==  ^"#{code_2}",
      select: [p.excludes1],
      order_by: [asc: p.icd10cm_code_2] )

      res = Repo.all(query)
      str_split = List.to_string(res)

  end
#########################
  ######################
  def search_icd10clinicals_inclusionterm(code_2) do

    query =
      from(
       p in Icd10clinical,
        where: p.icd10cm_code_2 ==  ^"#{code_2}",
        select: [p.inclusionterm],
        order_by: [asc: p.icd10cm_code_2] )

        res = Repo.all(query)
        str_split = List.to_string(res)

    end
  #########################
  def search_icd10clinicals_includes(code_2) do

  query =
    from(
     p in Icd10clinical,
      where: p.icd10cm_code_2 ==  ^"#{code_2}",
      select: [p.includes],
      order_by: [asc: p.icd10cm_code_2] )

      res = Repo.all(query)
      str_split = List.to_string(res)

  end
  ##########################
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
      or_where: ilike(d.long_description, ^"#{query}%"),
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
      from p in Icd10cm_neoplasm,
        order_by: [asc: p.title],
        where: p.title == ^"#{term}",
        #where: fragment("(?) @@ plainto_tsquery(?)", p.title,   ^("#{term}%")  ),
        select: %{main_term: fragment("? ", p.main_term), title: fragment(" ? ", p.title)},
        limit: 10

    main_term_q |> Repo.all()
  end

  ############################# 3
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
      Enum.map(records_b, fn rec ->
        main_term_rec = rec[:main_term]

        #IO.inspect(main_term_rec)

        case code_order do
          "primary" ->
            code = main_term_rec["0.term_cell_l.0.cell_code"]

            if(code !== nil) do
              code
            else
              "None"
            end

          "secondary" ->
            code = main_term_rec["0.term_cell_l.1.cell_code"]

            if(code !== nil) do
              code
            else
              "None"
            end

          "in_situ" ->
            code = main_term_rec["0.term_cell_l.2.cell_code"]

            if(code !== nil) do
              code
            else
              "None"
            end

          "benign" ->
            code = main_term_rec["0.term_cell_l.3.cell_code"]

            if(code !== nil) do
              code
            else
              "None"
            end

          "uncetain" ->
            code = main_term_rec["0.term_cell_l.4.cell_code"]

            if(code !== nil) do
              code
            else
              "None"
            end

          "unspecified" ->
            code = main_term_rec["0.term_cell_l.5.cell_code"]

            if(code !== nil) do
              code
            else
              "None"
            end

          _ ->
            " "
        end

        # case
      end)

      # IO.inspect  primary_code
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
    _title_q =
      from p in Icd10cm_neoplasm,
        order_by: [asc: p.title],
        where: p.title == ^"#{query}",
        limit: 10
  end

  ################# 3

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

  ##################### 33
  def list_icd10cm_eindexes(_params) do
    _page =
      Icd10cm_eindex
      |> order_by([p], [p.title])
  end

  #######################################
  def find_icd10cm_eindexes_records(q_title) do
    query =
      from(
        p in Icd10cm_eindex,
        where: ilike(p.title, ^"#{q_title}%"),
        select: [p.main_term_jsonb],
        limit: 250
      )

    query |> Repo.all()
  end
####################################
def search_eindexes(query, selection) do
  case selection do
    "title" -> search_icd10cm_eindex_title(query)
    "main_term_jsonb" -> search_icd10cm_eindex_main_term(query)
    _ -> ""
  end
end
##########################################
def search_icd10cm_eindex_title(title) do
  query =
  from(
    p in Icd10cm_eindex,
    where: ilike(p.title, ^"#{title}%"),
    limit: 5
  )
end
#########################################
def search_icd10cm_eindex_main_term(query) do
  query = from(
    d in Icd10cm_eindex,
    #where: fragment("(?) @@ toquery (?)", d.main_term_jsonb, ^query),
    #or_where: jsonb_each( '{"name": "Alice", "agent": {"bot": true} }'::jsonb );
    # ilike(d.long_description, ^"#{query}%"),
   # where: fragment("? @> ?", d.main_term_jsonb, ^query),
  # select: [d.main_term_jsonb, d.title],
   where: fragment("?->> ?  = ? ", d.main_term_jsonb,  "term_title" ,  ^"#{query}%"    ),
   order_by: [asc: d.title]
  )
 # query |> Repo.all()

  #movement_id = 2
  #from wo in Workout,
 #   where: fragment(~s(?#>'{movements}' @> ?), wo.details, ^[%{id: movement_id}])
 # from(t in Team, where: t.owner_id == ^user_id and fragment("?->>'see_owner' = ?", t.config, true))
end

############################################
  def make_icd10cm_eindexes_jsonb(title) do
    records = find_icd10cm_eindexes_records(title)

    Enum.map(records, fn l ->
      terms_l = Enum.map(l, fn x -> x["terms_l"] end)

      main_title = Enum.map(l, fn x -> x["main_title"] end)

      main_code = Enum.map(l, fn x -> x["main_code"] end)
      main_codes = Enum.map(l, fn x -> x["main_codes"] end)
      main_see_probe = Enum.map(l, fn x -> x["main_see"] end)
      main_see_codes = Enum.map(l, fn x -> x["main_see_codes"] end)
      main_see_tab = Enum.map(l, fn x -> x["main_see_tab"] end)
      main_use_probe = Enum.map(l, fn x -> x["main_use"] end)

      formated =
        "main title " <> "#{main_title}" <>
         "main_code " <> "#{main_code}" <>
          " " <>
          "main_codes " <> "#{main_codes}" <>
          " " <>
          "main_see_probe " <>"#{main_see_probe}" <>
          " " <>
          "main_see_codes " <>  "#{main_see_codes}" <>
          " " <>
          "main_see_tab "<>  "#{main_see_tab}" <>
          " " <>
          "main_use_probe "<>  "#{main_use_probe}"

        #IO.puts("-----------formated---------------------" )
        #IO.inspect formated
        #IO.puts("----------------------------------------")

          # format_jsonb(formated)

      if Enum.any?(terms_l) do
        Enum.map(terms_l, fn terms ->
          Enum.map(terms, fn a_term ->
            format_term(a_term)
          end)

          ## a_term
        end)
      end

      # if
    end)
  end

  ################################## 3
  def format_jsonb(key) do
    key
  end

  ####################
  def format_term(a_term) do
    a =
      a_term
      |> Enum.filter(fn {_, v} -> v != "" end)
      |> Enum.into(%{})

    term_level = a["term_level"]
    intend = level_intend(term_level)
    #term_level = a["term_level"]
    term_title = a["term_title"]
    term_nemod = a["term_nemod"]
    term_codes = a["term_codes"]
    term_use_probe = a["term_use"]
    term_see_probe = a["term_see"]
    term_see_codes = a["term_see_codes"]
    term_see_tab = a["term_see_tab"]
    term_code = a["term_code"]

    term_use =
      if "#{term_use_probe}" != "" do
        "<span style='background-color:cyan'>" <> " use " <> "#{term_use_probe}" <> "</span>"
      else
        " "
      end

    term_see =
      if "#{term_see_probe}" != "" do
        "<span style='color:darkblue;margin-left:10px;'><em>" <>
          " See " <>
          "#{term_see_probe}" <>
          "</em></span>"
      else
        " "
      end

    # <> "<span class='badge primary'>"
    # <>  "#{term_code}"
    # <> "</span>"
    result =
      intend <>
        "#{term_title}" <>
        " " <>
        "#{term_nemod}" <>
        " " <>
        "#{term_use_probe}" <>
        "  " <>
        "<span style='color:#993333;margin-left:10px;'>" <>
        "#{term_see}" <>
        "<strong>" <>
        "#{term_code}" <>
        "</strong>" <>
        "</span>" <>
        "  " <>
        "#{term_codes}" <>
        "<br/>"

    header =
      "#{term_see_tab}" <>
        "  " <>
        "#{term_see_codes}" <>
        "  " <>
        "  " <> "#{term_use}"

    _final = header <> result
    # final = "<ul class ='no-bullet'>" <> header <> result <> "</ul>"
  end

  ################################
  def level_intend(term_level) do
    _intend =
      case term_level do
        "1" ->
          "<span style='margin-left:10px; margin-top:20px;margin-bottom:20px;color:#e41a1c;'>" <>
            "1- " <>
            "<i class= 'fa fa-snowflake-o' style='color:#e41a1c; margin-top:15px;' ></i> " <>

            "</span>"

        "2" ->
           "<span style='margin-left:30px; color:#377eb8;'>" <>
            "2- - " <>
            "<i class= 'fa  fa-chevron-right' style='color:#377eb8;margin-top:5px;'' ></i> " <>
            "</span>"

        "3" ->
          "<span style='margin-left:50px; color:#4daf4a;'>" <>
            "3- - - " <>
            "<i class= 'fa fa-chevron-right' style='color:#4daf4a;margin-top:5px;'></i> " <>
            "</span>"

        "4" ->
          "<span style='margin-left:70px;color:#984ea3;'>" <>
            "4- - - - " <>
            "<i class= 'fa fa-chevron-right' style='color:#984ea3;margin-top:5px;'></i> " <>
            "</span>"

        "5" ->
          "<span style='margin-left:90px;color:#ff7f00;'>" <>
            "5- - - - - " <>
            "<i class= 'fa fa-chevron-right' style='color:#ff7f00;margin-top:5px; '></i> " <>
            "</span>"

        "6" ->
          "<span style='margin-left:110px;color:#ffff33;'>" <>
            "6- - - - - - " <>
            "<i class= 'fa fa-chevron-right' style='color:#ffff33; margin-top:5px;'></i> " <>
            "</span>"

        "7" ->
          "<span style='margin-left:130px;color:#a65628;'>" <>
            "7- - - - - - - " <>
            "<i class= 'fa fa-chevron-right' style='color:#a65628;margin-top:5px;'></i> " <>
            "</span>"

            "8" ->
              "<span style='margin-left:150px;color:#a65628;'>" <>
                "8- - - - - - - - " <>
                "<i class= 'fa fa-chevron-right' style='color:#4575b4;margin-top:5px;'></i> " <>
                "</span>"
        _ ->
          "\t"
      end
  end

  ## level_intend

  ################################

  ############## 3

  alias Icd10cm.Codes.Icd10cm_order

  @doc """
  Returns the list of iicd10cm_orders.

  ## Examples

      iex> list_iicd10cm_orders()
      [%Icd10cm_order{}, ...]

  """
  def list_iicd10cm_orders do
    Repo.all(Icd10cm_order)
  end

  @doc """
  Gets a single icd10cm_order.

  Raises `Ecto.NoResultsError` if the Icd10cm order does not exist.

  ## Examples

      iex> get_icd10cm_order!(123)
      %Icd10cm_order{}

      iex> get_icd10cm_order!(456)
      ** (Ecto.NoResultsError)

  """
  def get_icd10cm_order!(id), do: Repo.get!(Icd10cm_order, id)

  @doc """
  Creates a icd10cm_order.

  ## Examples

      iex> create_icd10cm_order(%{field: value})
      {:ok, %Icd10cm_order{}}

      iex> create_icd10cm_order(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_icd10cm_order(attrs \\ %{}) do
    %Icd10cm_order{}
    |> Icd10cm_order.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a icd10cm_order.

  ## Examples

      iex> update_icd10cm_order(icd10cm_order, %{field: new_value})
      {:ok, %Icd10cm_order{}}

      iex> update_icd10cm_order(icd10cm_order, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_icd10cm_order(%Icd10cm_order{} = icd10cm_order, attrs) do
    icd10cm_order
    |> Icd10cm_order.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a icd10cm_order.

  ## Examples

      iex> delete_icd10cm_order(icd10cm_order)
      {:ok, %Icd10cm_order{}}

      iex> delete_icd10cm_order(icd10cm_order)
      {:error, %Ecto.Changeset{}}

  """
  def delete_icd10cm_order(%Icd10cm_order{} = icd10cm_order) do
    Repo.delete(icd10cm_order)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking icd10cm_order changes.

  ## Examples

      iex> change_icd10cm_order(icd10cm_order)
      %Ecto.Changeset{data: %Icd10cm_order{}}

  """
  def change_icd10cm_order(%Icd10cm_order{} = icd10cm_order, attrs \\ %{}) do
    Icd10cm_order.changeset(icd10cm_order, attrs)
  end


  def list_icd10cm_orders(_params) do
    _page =
      Icd10cm_order
      |> order_by([p], [p.long_description])
  end

################################
 ################# 33
 def search_orders(query, selection) do
  case selection do
    "codes_2" -> search_icd10cm_order_codes(query)
    "long_description" -> search_icd10cm_order_long_description(query)
    _ -> ""
  end
end

######################
def search_icd10cm_order_codes(query) do

  _query =
  from(
    p in Icd10cm_order,
    where: ilike(p.icd10cm_code_2, ^"#{query}%"),
    limit: 50,
    order_by: [asc: p.icd10cm_code_2]
  )

end
###################################3
def search_icd10cm_order_long_description(query) do
  from(
    d in Icd10cm_order,
    #this is not working properly ?
    where: fragment("(?) @@ plainto_tsquery(?)", d.long_description_tsv, ^query),
    #where: fragment("(?) @@ plainto_tsquery(?)", d.long_description, ^query),
    or_where: ilike(d.long_description, ^"#{query}%"),
    order_by: [asc: d.long_description]
  )


end
#################################
def search_icd10cm_order_codes_from_clinical(query) do
  query =
  from(
    p in Icd10cm_order,
    where: ilike(p.icd10cm_code_2, ^"#{query}%"),
    select: [p.icd10cm_code_2, p.long_description],
    limit: 20
  )

text = query |> Repo.all()
flatten = List.flatten(text)


result = Enum.map(flatten, fn item ->
  "<tr>"
  <> "<td>"
  <> item
  <> "</td>"
  <> "</tr>"
end)

result

#IO.puts("------text----------------")
#IO.inspect result
#[["V89.2"], ["V89.2XXA"], ["V89.2XXD"], ["V89.2XXS"]]
#result = String.split(text, ",")


end
#####################3

  alias Icd10cm.Codes.Ctd

  @doc """
  Returns the list of ctds.

  ## Examples

      iex> list_ctds()
      [%Ctd{}, ...]

  """
  def list_ctds do
    Repo.all(Ctd)
  end

  @doc """
  Gets a single ctd.

  Raises `Ecto.NoResultsError` if the Ctd does not exist.

  ## Examples

      iex> get_ctd!(123)
      %Ctd{}

      iex> get_ctd!(456)
      ** (Ecto.NoResultsError)

  """
  def get_ctd!(id), do: Repo.get!(Ctd, id)

  @doc """
  Creates a ctd.

  ## Examples

      iex> create_ctd(%{field: value})
      {:ok, %Ctd{}}

      iex> create_ctd(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_ctd(attrs \\ %{}) do
    %Ctd{}
    |> Ctd.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a ctd.

  ## Examples

      iex> update_ctd(ctd, %{field: new_value})
      {:ok, %Ctd{}}

      iex> update_ctd(ctd, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_ctd(%Ctd{} = ctd, attrs) do
    ctd
    |> Ctd.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ctd.

  ## Examples

      iex> delete_ctd(ctd)
      {:ok, %Ctd{}}

      iex> delete_ctd(ctd)
      {:error, %Ecto.Changeset{}}

  """
  def delete_ctd(%Ctd{} = ctd) do
    Repo.delete(ctd)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking ctd changes.

  ## Examples

      iex> change_ctd(ctd)
      %Ecto.Changeset{data: %Ctd{}}

  """
  def change_ctd(%Ctd{} = ctd, attrs \\ %{}) do
    Ctd.changeset(ctd, attrs)
  end
#####################
def list_ctds(_params) do
  _page =
    Ctd
    |> order_by([p], [p.diseasename])
end
####################
def format_ctd_colums(synonyms) do
  if(synonyms !== nil) do

  split = String.split(synonyms, "|")

  _result =
  Enum.map(split, fn item ->
    "<span > "
    <> "<i class='fa fa-caret-right' style='font-size:20px;color:#1b9e77;''></i>"
    <> " "
    <> item
    <> "&nbsp;&nbsp;&nbsp;&nbsp;"
    <> "<br/>"
    <> "</span>"
  end)
   #IO.puts("------------------synonyms---------------")
   #IO.inspect result
end#if

end#format_ctd_columns
#####################
def search_ctds(query, selection) do
  case selection do
    "diseasenames" -> search_ctds_diseasnames(query)
    "synonyms" -> search_ctds_synonyms(query)
    "definitions" -> search_ctds_definitions(query)

    _ -> ""
  end
end
#######################3
def search_ctds_definitions(orders_long_description) do

  #defs = from(
  #  d in Ctd,
  #  where: fragment("(?) @@ plainto_tsquery(?)", d.diseasename, ^"#{orders_long_description}"),
  #  #or_where: ilike(d.diseasename, ^"#{orders_long_description}%"),
  #  select: [d.definition],
  #  order_by: [asc: d.diseasename]
  #)
  #res = Repo.all(defs)

  #IO.puts("----------------------")
  #IO.inspect(res)
end
#############################
def search_ctds_diseasnames(query) do

from(
      d in Ctd,
      where: fragment("(?) @@ plainto_tsquery(?)", d.diseasename, ^query),
      # or  where: ilike(d.long_description, ^"#{query}%"),
      order_by: [asc: d.diseasename]
    )
end
##########################
def search_ctds_synonyms(query) do
 synonym =  from(
    d in Ctd,
    where: fragment("(?) @@ plainto_tsquery(?)", d.synonyms, ^query),
    # or  where: ilike(d.long_description, ^"#{query}%"),
    order_by: [asc: d.diseasename]
  )

  #IO.puts("---synonym-------")
  #IO.inspect synonym

end
################

  alias Icd10cm.Codes.Icd10cm_dindex

  @doc """
  Returns the list of icd10cm_dindexes.

  ## Examples

      iex> list_icd10cm_dindexes()
      [%Icd10cm_dindex{}, ...]

  """
  def list_icd10cm_dindexes do
    Repo.all(Icd10cm_dindex)
  end

  @doc """
  Gets a single icd10cm_dindex.

  Raises `Ecto.NoResultsError` if the Icd10cm dindex does not exist.

  ## Examples

      iex> get_icd10cm_dindex!(123)
      %Icd10cm_dindex{}

      iex> get_icd10cm_dindex!(456)
      ** (Ecto.NoResultsError)

  """
  def get_icd10cm_dindex!(id), do: Repo.get!(Icd10cm_dindex, id)

  @doc """
  Creates a icd10cm_dindex.

  ## Examples

      iex> create_icd10cm_dindex(%{field: value})
      {:ok, %Icd10cm_dindex{}}

      iex> create_icd10cm_dindex(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_icd10cm_dindex(attrs \\ %{}) do
    %Icd10cm_dindex{}
    |> Icd10cm_dindex.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a icd10cm_dindex.

  ## Examples

      iex> update_icd10cm_dindex(icd10cm_dindex, %{field: new_value})
      {:ok, %Icd10cm_dindex{}}

      iex> update_icd10cm_dindex(icd10cm_dindex, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_icd10cm_dindex(%Icd10cm_dindex{} = icd10cm_dindex, attrs) do
    icd10cm_dindex
    |> Icd10cm_dindex.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a icd10cm_dindex.

  ## Examples

      iex> delete_icd10cm_dindex(icd10cm_dindex)
      {:ok, %Icd10cm_dindex{}}

      iex> delete_icd10cm_dindex(icd10cm_dindex)
      {:error, %Ecto.Changeset{}}

  """
  def delete_icd10cm_dindex(%Icd10cm_dindex{} = icd10cm_dindex) do
    Repo.delete(icd10cm_dindex)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking icd10cm_dindex changes.

  ## Examples

      iex> change_icd10cm_dindex(icd10cm_dindex)
      %Ecto.Changeset{data: %Icd10cm_dindex{}}

  """
  def change_icd10cm_dindex(%Icd10cm_dindex{} = icd10cm_dindex, attrs \\ %{}) do
    Icd10cm_dindex.changeset(icd10cm_dindex, attrs)
  end
##########################
def list_icd10cm_dindexes(_params) do
  _page =
    Icd10cm_dindex
    |> order_by([p], [p.title])

end
##########################
def search_dindexes(query, selection) do
  case selection do
    "title" -> get_dindex_from_title(query)
    #"long_desc" -> search_icd10clinicals_long_desc(query)
    _ -> ""
  end


end
###########################
def get_dindex_from_title(title) do
  main_term_q =
  from p in Icd10cm_dindex,
    order_by: [asc: p.title],
    where: ilike(p.title, ^"#{title}%"),
    #where: p.title == ^"#{title}",
    limit: 30

end
###########################
def get_dindex_title(title) do
  main_term_q =
  from p in Icd10cm_dindex,
    order_by: [asc: p.title],
    where: p.title == ^"#{title}",
    select: %{main_term: fragment("? ", p.main_term), title: fragment(" ? ", p.title)},
    limit: 10

main_term_q |> Repo.all()
end
##########################
def find_dindex_code(title, poisoning) do
  records_b = get_dindex_title(title)

  if Enum.any?(records_b) do

    Enum.map(records_b, fn rec ->
      main_term_rec = rec[:main_term]
      case poisoning do
        "accidental" ->
          #code = main_term_rec["0.term_cell_l.0.cell_code"]
          code = main_term_rec["main_cell_l.0.main_cell_code"]

          if(code !== nil) do
            code
          else
            "None"
          end
          "intentional" ->
            code = main_term_rec["main_cell_l.1.main_cell_code"]

            if(code !== nil) do
              code
            else
              "None"
            end


            "assault" ->
              code = main_term_rec["main_cell_l.2.main_cell_code"]

              if(code !== nil) do
                code
              else
                "None"
              end


              "undetermined" ->
                code = main_term_rec["main_cell_l.3.main_cell_code"]

                if(code !== nil) do
                  code
                else
                  "None"
                end


              "adverse_effect" ->
                code = main_term_rec["main_cell_l.4.main_cell_code"]

                if(code !== nil) do
                  code
                else
                  "None"
                end


                "underdosing" ->
                  code = main_term_rec["main_cell_l.5.main_cell_code"]

                  if(code !== nil) do
                    code
                  else
                    "None"
                  end

          _ ->
            " "
          end

          # case
        end)


  end#if


end#def
  #############################

  alias Icd10cm.Codes.Icd10pcs

  @doc """
  Returns the list of icd10_pcses.

  ## Examples

      iex> list_icd10_pcses()
      [%Icd10pcs{}, ...]

  """
  def list_icd10_pcses(_params) do
    _page =
    Icd10pcs
    |> order_by([p], [p.long_description])
end


  def list_icd10_pcses do
    Repo.all(Icd10pcs)
  end

  @doc """
  Gets a single icd10pcs.

  Raises `Ecto.NoResultsError` if the Icd10pcs does not exist.

  ## Examples

      iex> get_icd10pcs!(123)
      %Icd10pcs{}

      iex> get_icd10pcs!(456)
      ** (Ecto.NoResultsError)

  """
  def get_icd10pcs!(id), do: Repo.get!(Icd10pcs, id)

  @doc """
  Creates a icd10pcs.

  ## Examples

      iex> create_icd10pcs(%{field: value})
      {:ok, %Icd10pcs{}}

      iex> create_icd10pcs(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_icd10pcs(attrs \\ %{}) do
    %Icd10pcs{}
    |> Icd10pcs.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a icd10pcs.

  ## Examples

      iex> update_icd10pcs(icd10pcs, %{field: new_value})
      {:ok, %Icd10pcs{}}

      iex> update_icd10pcs(icd10pcs, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_icd10pcs(%Icd10pcs{} = icd10pcs, attrs) do
    icd10pcs
    |> Icd10pcs.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a icd10pcs.

  ## Examples

      iex> delete_icd10pcs(icd10pcs)
      {:ok, %Icd10pcs{}}

      iex> delete_icd10pcs(icd10pcs)
      {:error, %Ecto.Changeset{}}

  """
  def delete_icd10pcs(%Icd10pcs{} = icd10pcs) do
    Repo.delete(icd10pcs)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking icd10pcs changes.

  ## Examples

      iex> change_icd10pcs(icd10pcs)
      %Ecto.Changeset{data: %Icd10pcs{}}

  """
  def change_icd10pcs(%Icd10pcs{} = icd10pcs, attrs \\ %{}) do
    Icd10pcs.changeset(icd10pcs, attrs)
  end

###############################
def search_pcs(query, selection) do
    case selection do
      "codes_2" -> search_pcs_code_2(query)
      "long_codes" -> search_pcs_long_codes(query)
      "long_description" -> search_pcs_long_description(query)
      _ -> ""
    end

end
################################
def search_pcs_code_2(term) do
  IO.puts("---------TERM--------------------------- " )
  IO.inspect(term)
  from p in Icd10pcs,
  order_by: [asc: p.long_description],
  where: fragment("(?) ilike(?)", p.icd10pcs_code_2,   ^("#{term}%") )   ,
  limit: 25
  end

#################################
def search_pcs_long_codes(term) do
    from p in Icd10pcs,
    order_by: [asc: p.long_description],
    where: fragment("(?) @@ plainto_tsquery(?)", p.long_description,   ^("#{term}%")  )
     or fragment("(?) ilike(?)", p.icd10pcs_code_2,   ^("#{term}%") )   ,
    #select: [ p.icd10pcs_code_2, p.long_description, p.is_header],
    limit: 25


  end
################################
def search_pcs_long_description(term) do
  from p in Icd10pcs,
  order_by: [asc: p.long_description],
  where: fragment("(?) @@ plainto_tsquery(?)", p.long_description,   ^("#{term}%")  ),
  limit: 25


end
################################


  alias Icd10cm.Codes.Icd10pcs_defs

  @doc """
  Returns the list of icd10pcs_defs.

  ## Examples

      iex> list_icd10pcs_defs()
      [%Icd10pcs_defs{}, ...]

  """
  def list_icd10pcs_defs(_params) do

      _page =
      Icd10pcs_defs
      |> order_by([p], [p.term_titles])

    end

  @doc """
  Gets a single icd10pcs_defs.

  Raises `Ecto.NoResultsError` if the Icd10pcs defs does not exist.

  ## Examples

      iex> get_icd10pcs_defs!(123)
      %Icd10pcs_defs{}

      iex> get_icd10pcs_defs!(456)
      ** (Ecto.NoResultsError)

  """
  def get_icd10pcs_defs!(id), do: Repo.get!(Icd10pcs_defs, id)

  @doc """
  Creates a icd10pcs_defs.

  ## Examples

      iex> create_icd10pcs_defs(%{field: value})
      {:ok, %Icd10pcs_defs{}}

      iex> create_icd10pcs_defs(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_icd10pcs_defs(attrs \\ %{}) do
    %Icd10pcs_defs{}
    |> Icd10pcs_defs.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a icd10pcs_defs.

  ## Examples

      iex> update_icd10pcs_defs(icd10pcs_defs, %{field: new_value})
      {:ok, %Icd10pcs_defs{}}

      iex> update_icd10pcs_defs(icd10pcs_defs, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_icd10pcs_defs(%Icd10pcs_defs{} = icd10pcs_defs, attrs) do
    icd10pcs_defs
    |> Icd10pcs_defs.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a icd10pcs_defs.

  ## Examples

      iex> delete_icd10pcs_defs(icd10pcs_defs)
      {:ok, %Icd10pcs_defs{}}

      iex> delete_icd10pcs_defs(icd10pcs_defs)
      {:error, %Ecto.Changeset{}}

  """
  def delete_icd10pcs_defs(%Icd10pcs_defs{} = icd10pcs_defs) do
    Repo.delete(icd10pcs_defs)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking icd10pcs_defs changes.

  ## Examples

      iex> change_icd10pcs_defs(icd10pcs_defs)
      %Ecto.Changeset{data: %Icd10pcs_defs{}}

  """
  def change_icd10pcs_defs(%Icd10pcs_defs{} = icd10pcs_defs, attrs \\ %{}) do
    Icd10pcs_defs.changeset(icd10pcs_defs, attrs)
  end

####################################
def search_pcs_defs(query, selection) do
  case selection do
    "term_title" -> search_pcs_defs_term_titles(query)
    #"long_codes" -> search_pcs_long_codes(query)
    #"long_description" -> search_pcs_long_description(query)
    _ -> ""
  end

end
####################################
def search_pcs_defs_term_titles(query) do
  from p in Icd10pcs_defs,
  order_by: [asc: p.term_titles],
  where: fragment("(?) @@ plainto_tsquery(?)", p.term_titles,   ^("#{query}%")  ),
  #select: %{terms: fragment("? ", p.terms),
  #          section_title: fragment(" ? ",  p.section_title),
  #          section: fragment(" ? ", p.section)
  #}
  limit: 10

end

####################################
end
