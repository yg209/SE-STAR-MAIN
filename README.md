# SE-STAR Project

SE-STAR is a Web3 security dashboard, combining AI trust scoring and Ethereum smart contracts to protect users from scams and fraud.

## Features
- AI-powered wallet risk analysis
- Public fraud flagging APIs
- Admin controls (flag/unflag, assign rewards)
- Token presale portal

## Setup

### Prerequisites
- [Node.js](https://nodejs.org/) (v18+ recommended)
- [npm](https://www.npmjs.com/)
- [Hardhat](https://hardhat.org/)

### Installation

```bash
git clone https://github.com/yg209/SE-STAR-MAIN.git
cd SE-STAR-MAIN
npm install
```

### Development

```bash
npm run dev   # or 'npm start' if you set up the script
```

### Smart Contract Testing

```bash
npx hardhat test
```

### Environment Variables

1. Duplicate `.env.example` as `.env` and fill in details:
    ```
    INFURA_API_KEY=your_api_key
    PRIVATE_KEY=your_private_key
    ```

### Deployment

```bash
npx hardhat run scripts/deploy.js --network sepolia
```

## Directory Structure

```
/
├── index.html
├── presale.html
├── mascot.html
├── styles.css
├── package.json
├── hardhat.config.js
├── se-star-full-site-bundle/
│   └── ...
└── README.md
```

## License

MIT
