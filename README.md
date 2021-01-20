# MINI-STATE-MACHINE

Le but de ce projet est de pouvoir modifier une valeur si on est owner, par contre si on ne l'est pas pour modifier cette valeur il faut payer.

## Motivation

Ce projet a été fait pour découvrir et tester l'environnement de développement d'Ethereum.
Dans ce projet nous utilisons le terminal Node.js ainsi que Hardhat.

## Install

Il faut commencer par cloner le projet git, puis aller dans le dossier `StateMachineHardhat`et installer le dossier.

```sh
git clone https://github.com/theocdl/StateMachineHardhat.git
cd StateMachineHardhat
npm install
```

## Test

Pour lancer la séquence de test, il faut taper la commande suivante : 

```sh
npx hardhat test
```
Ensuite on a le resultalt de ce test, vous devriez avoir ceci

```sh
  Mini State Machine contract
    Deployment
      √ Set owner
    Change value
      √ Owner change value by setValue (60ms)
      √ Addres1 can't change value by setValue (54ms)
      √ Owner change value by setValuePayable (54ms)
      √ Addres1 change value by setValuePayable


  5 passing (2s)
```

## Usage

Ce projet sert à modifier une valeur si on est owner, par contre si on ne l'est pas pour modifier cette valeur il faut payer.

**Happy _buidling_!**
