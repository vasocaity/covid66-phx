defmodule Covid.Data do
    alias Covid.Virus.Info
    alias Covid.Repo
    def list_viruses do
        Info
        |> Repo.all()
    end

    def get_virus_by_id(id) do
       Info
       |> Repo.get!(id)
    end

    def get_virus_by_code(code) do
       Info
       |> Repo.get_by(code: code)
    end

    def create(virus \\ %{}) do
        %Info{}
        |> Info.changeset(virus)
        |> Repo.insert()
    end

    def change_info(%Info{} = info) do 
        Info.changeset(info, %{})
    end

    def update_virus(%Info{} = info, attrs) do
        info
        |> Info.changeset(attrs)
        |> Repo.update()
    end
end