FROM mcr.microsoft.com/dotnet/sdk:5.0 as build

WORKDIR /src

COPY Example.sln .
COPY Example/Example.csproj ./Example/
RUN dotnet restore

COPY Example/. ./Example/

RUN dotnet publish -c release -o /app --no-restore

# Runtime image
FROM mcr.microsoft.com/dotnet/aspnet:5.0

WORKDIR /app

COPY --from=build /app ./
ENTRYPOINT ["dotnet", "Example.dll"]