defmodule CovidWeb.VirusController do
  use CovidWeb, :controller
  alias Covid.Data
  alias Covid.Virus.Info


  def index(conn, _params) do
    viruses = Data.list_viruses
    render(conn, "index.html", viruses: viruses)
  end

  def show(conn, %{"id" => id}) do
    virus = Data.get_virus_by_id(id)
    render(conn, "show.html", virus: virus)
  end

  def new(conn, _params) do
    changeset = Data.change_info(%Info{}) 
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"info"=> info_param}) do
    {:ok, virus} = Data.create(info_param)
    conn
    |> put_flash(:info, "Virus created successfully.")
    |> redirect(to: Routes.virus_path(conn, :index))
  end

  def edit(conn, %{"id" => id}) do
    virus = Data.get_virus_by_id(id)
    changeset = Data.change_info(virus) 
    render(conn, "edit.html", virus: virus, changeset: changeset)
  end

  def update(conn, %{"id" => id, "info" => info_param}) do
    virus = Data.get_virus_by_id(id)
    case Data.update_virus(virus, info_param) do 
      {:ok, video} ->
      conn
      |> put_flash(:info, "Virus updated successfully.")
      |> redirect(to: Routes.virus_path(conn, :show, virus))
  
      {:error, %Ecto.Changeset{} = changeset} ->
      render(conn, "edit.html",  virus: virus, changeset: changeset)
    end
  end
  
end
