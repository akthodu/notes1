# Azure key Vault
- Encryption keys --> Encrypting data(VMs, Storage accounts and DBs)
- Secrets - Passwords
- Certificates


```
az ad sp create-for-rbac -n dev --skip-assignment

# Define the following environment variables first

AZURE_CLIENT_ID="d848c294-4455-4787-9911-84f51d5a0854"
AZURE_CLIENT_SECRET="n1Oh3CzmMW8w5V3KCRp9_VyTXrsz2MoVAn"
AZURE_TENANT_ID="9f63cfac-482f-45bf-a1d2-6d5c6398abc6"

az keyvault set-policy --name testkeyvalut --spn "dev" --secret-permissions backup delete get list set
```

### Access the secret programtically

```
# Provide the vault URL
string vault_url = "https://testkeyvault1015.vault.azure.net/";

#Create a connection to the vault
var client = new SecretClient(vaultUri: new Uri(vault_url), credential: new DefaultAzureCredential());

# Access Secret
 KeyVaultSecret secret = client.GetSecret("testsecret");
Console.WriteLine(secret.Value);
Console.ReadKey();

```

### Access Keys programatically

```
var client = new KeyClient(vaultUri: new Uri(lab_vault), credential: new DefaultAzureCredential());

#Get the value of the secret
KeyVaultKey kv = client.GetKey("testkey");
```

### Managed Security Identity

```
using Microsoft.Azure.KeyVault;
using Microsoft.Azure.Services.AppAuthentication;

AzureServiceTokenProvider provider = new AzureServiceTokenProvider();
var client = new KeyVaultClient(
          new KeyVaultClient.AuthenticationCallback(provider.KeyVaultTokenCallback));
var secret = await w_client.GetSecretAsync(Demo_secret)
                .ConfigureAwait(false);
 Console.WriteLine(secret.Value)
```