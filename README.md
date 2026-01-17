# MiPrimerToken (MPT) 🪙

> **Contrato Desplegado (Sepolia):** [`0x6b270f1a5ae0965048be8a3b59d852e17029362a`](https://sepolia.etherscan.io/address/0x6b270f1a5ae0965048be8a3b59d852e17029362a)

Este es un proyecto de token ERC20 básico (incluyendo funcionalidad de Ownership) desarrollado con **Foundry**.

## Pre-requisitos

Asegúrate de tener [Foundry](https://book.getfoundry.sh/getting-started/installation) instalado:

```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

## Instalación

1.  **Clonar el repositorio:**
    ```bash
    git clone <URL_DEL_REPO>
    cd MiPrimerToken
    ```

2.  **Instalar dependencias:**
    ```bash
    forge install
    ```

3.  **Configurar variables de entorno:**
    Crea un archivo `.env` en la raíz del proyecto basado en el siguiente ejemplo:
    ```ini
    # .env
    PRIVATE_KEY=0x...tu_clave_privada_aqui...
    SEPOLIA_RPC_URL=https://eth-sepolia.g.alchemy.com/v2/tu-api-key
    ETHERSCAN_API_KEY=tu-etherscan-api-key
    ```
    > ⚠️ **IMPORTANTE**: ¡Nunca compartas tu clave privada ni la subas a GitHub! Asegúrate de que `.env` esté en tu `.gitignore`.

## Estructura del Proyecto

- `src/`: Contratos inteligentes (`MiPrimerToken.sol`).
- `script/`: Scripts de despliegue (`MiPrimerToken.s.sol`).
- `test/`: Tests unitarios (`MiPrimerToken.t.sol`).
- `foundry.toml`: Configuración del proyecto.

## Comandos

### Compilar
```bash
forge build
```

### Testear
Ejecutar todos los tests:
```bash
forge test
```
Ver salida detallada de logs:
```bash
forge test -vv
```

### Desplegar (Sepolia)

Para desplegar en la red de prueba Sepolia y verificar el contrato en Etherscan:

1.  **Simulacro (Dry-Run):**
    Comprueba que todo esté bien configurado sin gastar gas.
    ```bash
    forge script script/MiPrimerToken.s.sol:DeployMiPrimerToken --rpc-url sepolia
    ```

2.  **Despliegue Real:**
    ```bash
    forge script script/MiPrimerToken.s.sol:DeployMiPrimerToken --rpc-url sepolia --broadcast --verify
    ```

## Direcciones Desplegadas

- **Sepolia Testnet**: `0x6b270f1a5ae0965048be8a3b59d852e17029362a` [Ver en Etherscan](https://sepolia.etherscan.io/address/0x6b270f1a5ae0965048be8a3b59d852e17029362a)
