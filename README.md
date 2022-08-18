
# mongodb-tally
This github action tally/syncs/rollback mongodb databases and collections from one cluster to the other

************************************************************************************
# Inputs
1. `source`: This is the source cluster's connetion URI. This contains the host, password, and endpoint

2. `destination`: This is the destination cluster's connetion URI. The URI contatins the host, password, and endpoint

3. `database`: This is the database that you want to roll down from the source to the destination's cluster

4. `exclude`: These are the collections you want to `EXEMPT` from being dumped and restored to the destination cluster. By default, the entire database from source is dumped and restored in the destination cluste IF NO exclusions are stated.

************************************************************************************

**Required** It is highly recommended to use secrets to store your Database connection URI.

# Outputs
1. `time`: The current completion time of the rollback

************************************************************************************

# Example Usage
## Example 1
Using github secrets for the database username, password, and host
```yml
- name: Rollback Sample Analytics Database
  id: rollback-1
  uses: sharhan-alhassan/mongodb-tally@v0.1.0
  with:
    source: mongodb+srv://${{ secrets.SOURCE_DB_USERNAME }}:${{ secrets.SOURCE_DB_PASSWORD }}@${{ secrets.SOURCE_DB_HOST }}
    destination: mongodb+srv://${{ secrets.DESTINATION_DB_USERNAME }}:${{ secrets.DESTINATION_DB_PASSWORD }}@${{ secrets.DESTINATION_DB_HOST }}
    database: sample_analytics
    exclude: accounts customers
```

## Example 2
Using github secrets to store the entire connection URI
```yml
- name: Rollback Sample Analytics Database
  id: rollback-1
  uses: sharhan-alhassan/mongodb-tally@v0.1.0
  with:
    source: ${{ secrets.SOURCE_CONNECTION_URI }}
    destination: ${{ secrets.DESTINATION_CONNECTION_URI }}
    database: sample_analytics
    exclude: accounts customers
```
************************************************************************************

# NB:
1. If you rollback entire database the first time without specifying any collection exemptions, any subsequent tally will not override existing data 
in the destination even if you specify collection exclusions

# Troubleshooting 
1. If your connection URI has any some special characters like `"?"`, you'll get the error `# zsh: no matches found:`
You will have to escape the `"?"` with a backlash or quote the entire connection URI
