//
//  WelcomeViewModel.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 18.06.2021.
//

import UIKit

final class WelcomeViewModel: WelcomeViewModelType {
  
  var myControllers = [UIViewController]()
  
  let pages: [String] = [
    "\n\n\n1. Two players need to choose the sign: (+) or (-). By default, the first move always makes the player (+)(blue color 🔵) and then the player (-)(red color 🔴).\n\n2. Game field - is a Matrix 3х3, which consists of the 9 cells. You should enter the number inside the each cell.\n\n3. Afyer all the cells have been filled, you will see the value of the Determinant (D) and a winner.\n\nFor restart press Start Over. Info section will provide you information about the Matrix 3x3.\n\nInstruction in Russian\n🇷🇺 ➡️\n\n⚫️ ⚪️ ⚪️ ",
    "\n\n\n1. Два игрока выбирают себе по знаку: (+) или (-) . По умолчанию первым ходит игрок со знаком (+)(синий цвет 🔵), затем игрок со знаком (-)(красный цвет 🔴).\n\n2. Игровое поле - это матрица 3х3, состоит из 9 ячеек, в каждую из которых нужно ввести число от 1 до 9.\n\n3. После того, как игровое поле будет заполнено, появится значение детерминанта и будет определен победитель. Чтобы начать сначала, нажмите на кнопку Начать Сначала. Ознакомиться с матрицей 3х3 можно в разделе ИНФО.\n➡️\n\n⚪️ ⚫️ ⚪️ ",
    "Желаем приятной игры!\nEnjoy the Game!\n🎮\n⬅️\n\n\n⚪️ ⚪️ ⚫️"
  ]
  
  func appendPageVC() {
    for text in pages {
      let vc = PageViewController(with: text)
      myControllers.append(vc)
    }
  }
  
}
