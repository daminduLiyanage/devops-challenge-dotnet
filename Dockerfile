# syntax=docker/dockerfile:1
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS base
# WORKDIR /app
    
  
# Copy everything else and build
# COPY src/DevOpsChallenge.SalesApi .
# RUN pwd
# RUN ls -l
# RUN dotnet restore
# RUN dotnet publish -c Release -o out
WORKDIR /src
COPY . .
RUN dotnet restore
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:5.0
EXPOSE 5000
EXPOSE 5001
WORKDIR /app
COPY --from=base /src/out .
ENTRYPOINT ["dotnet", "DevOpsChallenge.SalesApi.dll"]
