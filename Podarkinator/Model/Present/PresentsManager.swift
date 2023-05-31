//
//  PresentsManager.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 07.05.2023.
//

import Foundation

final class PresentsManager {
    static var shared = PresentsManager()
    
    private init() {}
    
    func questionPresent(for parameters: Parameters) -> Present? {
        let characteristicsParam = parameters.characteristics
        let presentParam = parameters.present
        let presentsData = PresentsData()
        
        if !presentParam.isDisjoint(with: .anyPresent) {
            return nil
        }
        
        // Fishing
        if characteristicsParam.isStrictSuperset(of: .fishingLowSet) {
            if presentParam.isEmpty {
                return presentsData.fishingLow1
            }
            if presentParam.isDisjoint(with: PresentParameters.secondPresentLayer) {
                return presentsData.fishingLow2
            }
            if presentParam.isDisjoint(with: PresentParameters.thirdPresentLayer) {
                return presentsData.fishingLow3
            }
        }
        
        if characteristicsParam.isStrictSuperset(of: .fishingMediumSet) {
            if presentParam.isEmpty {
                return presentsData.fishingMed1
            }
            if presentParam.isDisjoint(with: PresentParameters.secondPresentLayer) {
                return presentsData.fishingMed2
            }
            if presentParam.isDisjoint(with: PresentParameters.thirdPresentLayer) {
                return presentsData.fishingMed3
            }
        }
        
        if characteristicsParam.isStrictSuperset(of: .fishingHighSet) {
            if presentParam.isEmpty {
                return presentsData.fishingHigh1
            }
            if presentParam.isDisjoint(with: PresentParameters.secondPresentLayer) {
                return presentsData.fishingHigh2
            }
            if presentParam.isDisjoint(with: PresentParameters.thirdPresentLayer) {
                return presentsData.fishingHigh3
            }
        }
        
        // Football
        if characteristicsParam.isStrictSuperset(of: .footballLowSet) {
            if presentParam.isEmpty {
                return presentsData.footballLow1
            }
            if presentParam.isDisjoint(with: PresentParameters.secondPresentLayer) {
                return presentsData.footballLow2
            }
            if presentParam.isDisjoint(with: PresentParameters.thirdPresentLayer) {
                return presentsData.footballLow3
            }
        }
        
        if characteristicsParam.isStrictSuperset(of: .footballMediumSet) {
            if presentParam.isEmpty {
                return presentsData.footballMed1
            }
            if presentParam.isDisjoint(with: PresentParameters.secondPresentLayer) {
                return presentsData.footballMed2
            }
            if presentParam.isDisjoint(with: PresentParameters.thirdPresentLayer) {
                return presentsData.footballMed3
            }
        }
        
        if characteristicsParam.isStrictSuperset(of: .footballHighSet) {
            if presentParam.isEmpty {
                return presentsData.footballHigh1
            }
            if presentParam.isDisjoint(with: PresentParameters.secondPresentLayer) {
                return presentsData.footballHigh2
            }
            if presentParam.isDisjoint(with: PresentParameters.thirdPresentLayer) {
                return presentsData.footballHigh3
            }
        }
        
        // Video Games
        if characteristicsParam.isStrictSuperset(of: .gamingLowSet) {
            if presentParam.isEmpty {
                return presentsData.gamingLow1
            }
            if presentParam.isDisjoint(with: PresentParameters.secondPresentLayer) {
                return presentsData.gamingLow2
            }
            if presentParam.isDisjoint(with: PresentParameters.thirdPresentLayer) {
                return presentsData.gamingLow3
            }
        }
        
        if characteristicsParam.isStrictSuperset(of: .gamingMediumSet) {
            if presentParam.isEmpty {
                return presentsData.gamingMed1
            }
            if presentParam.isDisjoint(with: PresentParameters.secondPresentLayer) {
                return presentsData.gamingMed2
            }
            if presentParam.isDisjoint(with: PresentParameters.thirdPresentLayer) {
                return presentsData.gamingMed3
            }
        }
        
        if characteristicsParam.isStrictSuperset(of: .gamingHighSet) {
            if presentParam.isEmpty {
                return presentsData.gamingHigh1
            }
            if presentParam.isDisjoint(with: PresentParameters.secondPresentLayer) {
                return presentsData.gamingHigh2
            }
            if presentParam.isDisjoint(with: PresentParameters.thirdPresentLayer) {
                return presentsData.gamingHigh3
            }
        }
        
        // Jewelry
        if characteristicsParam.isStrictSuperset(of: .jewelryLowSet) {
            if presentParam.isEmpty {
                return presentsData.jewelryLow1
            }
            if presentParam.isDisjoint(with: PresentParameters.secondPresentLayer) {
                return presentsData.jewelryLow2
            }
            if presentParam.isDisjoint(with: PresentParameters.thirdPresentLayer) {
                return presentsData.jewelryLow3
            }
        }
        
        if characteristicsParam.isStrictSuperset(of: .jewelryMediumSet) {
            if presentParam.isEmpty {
                return presentsData.jewelryMed1
            }
            if presentParam.isDisjoint(with: PresentParameters.secondPresentLayer) {
                return presentsData.jewelryMed2
            }
            if presentParam.isDisjoint(with: PresentParameters.thirdPresentLayer) {
                return presentsData.jewelryMed3
            }
        }
        
        if characteristicsParam.isStrictSuperset(of: .jewelryHighSet) {
            if presentParam.isEmpty {
                return presentsData.jewelryHigh1
            }
            if presentParam.isDisjoint(with: PresentParameters.secondPresentLayer) {
                return presentsData.jewelryHigh2
            }
            if presentParam.isDisjoint(with: PresentParameters.thirdPresentLayer) {
                return presentsData.jewelryHigh3
            }
        }
        
        // Anime
        if characteristicsParam.isStrictSuperset(of: .animeLowSet) {
            if presentParam.isEmpty {
                return presentsData.animeLow1
            }
            if presentParam.isDisjoint(with: PresentParameters.secondPresentLayer) {
                return presentsData.animeLow2
            }
            if presentParam.isDisjoint(with: PresentParameters.thirdPresentLayer) {
                return presentsData.animeLow3
            }
        }
        
        if characteristicsParam.isStrictSuperset(of: .animeMediumSet) {
            if presentParam.isEmpty {
                return presentsData.animeMed1
            }
            if presentParam.isDisjoint(with: PresentParameters.secondPresentLayer) {
                return presentsData.animeMed2
            }
            if presentParam.isDisjoint(with: PresentParameters.thirdPresentLayer) {
                return presentsData.animeMed3
            }
        }
        
        if characteristicsParam.isStrictSuperset(of: .animeHighSet) {
            if presentParam.isEmpty {
                return presentsData.animeHigh1
            }
            if presentParam.isDisjoint(with: PresentParameters.secondPresentLayer) {
                return presentsData.animeHigh2
            }
            if presentParam.isDisjoint(with: PresentParameters.thirdPresentLayer) {
                return presentsData.animeHigh3
            }
        }
        
        // Sport
        if characteristicsParam.isStrictSuperset(of: .sportLowSet) {
            if presentParam.isEmpty {
                return presentsData.sportLow1
            }
            if presentParam.isDisjoint(with: PresentParameters.secondPresentLayer) {
                return presentsData.sportLow2
            }
            if presentParam.isDisjoint(with: PresentParameters.thirdPresentLayer) {
                return presentsData.sportLow3
            }
        }
        
        if characteristicsParam.isStrictSuperset(of: .sportMediumSet) {
            if presentParam.isEmpty {
                return presentsData.sportMed1
            }
            if presentParam.isDisjoint(with: PresentParameters.secondPresentLayer) {
                return presentsData.sportMed2
            }
            if presentParam.isDisjoint(with: PresentParameters.thirdPresentLayer) {
                return presentsData.sportMed3
            }
        }
        
        if characteristicsParam.isStrictSuperset(of: .sportHighSet) {
            if presentParam.isEmpty {
                return presentsData.sportHigh1
            }
            if presentParam.isDisjoint(with: PresentParameters.secondPresentLayer) {
                return presentsData.sportHigh2
            }
            if presentParam.isDisjoint(with: PresentParameters.thirdPresentLayer) {
                return presentsData.sportHigh3
            }
        }
        
        return nil
    }
}

struct PresentsData {
    // Fishing
    let fishingLow1 = Present(
        image: "https://m.media-amazon.com/images/I/61PyTu7z7FL._AC_SX679_.jpg",
        link: "https://www.amazon.com/Sougayilang-Telescopic-Fishing-Rod-Comfortable/dp/B07ZSF3TKV/ref=sr_1_8?c=ts&keywords=Fishing+Rods&qid=1683432038&s=hunting-fishing&sr=1-8&ts_id=3409871"
    )
    
    let fishingLow2 = Present(
        image: "https://m.media-amazon.com/images/I/71yOCUxM25L._AC_SX679_.jpg",
        link: "https://www.amazon.com/Sougayilang-Graphite-Telescopic-Saltwater-Freshwater/dp/B01HPYAZ6M/ref=sr_1_59?c=ts&keywords=Fishing%2BRods&qid=1683432304&refinements=p_36%3A-5000&rnid=386589011&s=hunting-fishing&sr=1-59&ts_id=3409871&th=1"
    )
    
    let fishingLow3 = Present(
        image: "https://m.media-amazon.com/images/I/61qY6BwgaUS._AC_SX679_.jpg",
        link: "https://www.amazon.com/Sougayilang-Telescopic-Spinning-Designed-Saltwater-Casting/dp/B07Y1JW5GY/ref=sr_1_63_sspa?c=ts&keywords=Fishing%2BRods&qid=1683432304&refinements=p_36%3A-5000&rnid=386589011&s=hunting-fishing&sr=1-63-spons&ts_id=3409871&smid=AOLREHXTO5XDA&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEzNjNYWk4zSFFGSzVQJmVuY3J5cHRlZElkPUEwMDgwOTkxM0w1VFYyUzFYR1NINyZlbmNyeXB0ZWRBZElkPUEwNDUyMjM1WjFFT0pYRUQzODdMJndpZGdldE5hbWU9c3BfbXRmJmFjdGlvbj1jbGlja1JlZGlyZWN0JmRvTm90TG9nQ2xpY2s9dHJ1ZQ&th=1&psc=1"
    )
    
    let fishingMed1 = Present(
        image: "https://m.media-amazon.com/images/I/6101J96zKUL._AC_SX679_.jpg",
        link: "https://www.amazon.com/CLORIS-Saltwater-Freshwater-12-Telescopic-MenTravel/dp/B08H58VC4D/ref=sr_1_2_sspa?c=ts&keywords=Fishing%2BRods&qid=1683432116&refinements=p_36%3A1253557011&rnid=386589011&s=hunting-fishing&sr=1-2-spons&ts_id=3409871&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEyWEJRNDZJWDhETE5SJmVuY3J5cHRlZElkPUEwOTQ1NDE3MUUzMUNQRDU2WkdWRCZlbmNyeXB0ZWRBZElkPUEwMDcxMzY5M0FEMUkwODNBVkMxWiZ3aWRnZXROYW1lPXNwX2F0ZiZhY3Rpb249Y2xpY2tSZWRpcmVjdCZkb05vdExvZ0NsaWNrPXRydWU&th=1&psc=1"
    )
    
    let fishingMed2 = Present(
        image: "https://m.media-amazon.com/images/I/714YGWuaXsL._AC_SX679_.jpg",
        link: "https://www.amazon.com/Sougayilang-Saltwater-Freshwater-Fishing-Silver/dp/B074KYCY4R/ref=sr_1_22_sspa?c=ts&keywords=Fishing%2BRods&qid=1683432116&refinements=p_36%3A1253557011&rnid=386589011&s=hunting-fishing&sr=1-22-spons&ts_id=3409871&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEyWEJRNDZJWDhETE5SJmVuY3J5cHRlZElkPUEwOTQ1NDE3MUUzMUNQRDU2WkdWRCZlbmNyeXB0ZWRBZElkPUEwOTk2MTQ5MTRTRVhQNFpNODA2OSZ3aWRnZXROYW1lPXNwX2J0ZiZhY3Rpb249Y2xpY2tSZWRpcmVjdCZkb05vdExvZ0NsaWNrPXRydWU&th=1"
    )
    
    let fishingMed3 = Present(
        image: "https://m.media-amazon.com/images/I/617rcQW5hJL._AC_SX679_.jpg",
        link: "https://www.amazon.com/Goture-Medium-Spinning-Fishing-Portable/dp/B0894ZYX5M/ref=sr_1_49_sspa?c=ts&keywords=Fishing%2BRods&qid=1683432262&refinements=p_36%3A1253557011&rnid=386589011&s=hunting-fishing&sr=1-49-spons&ts_id=3409871&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUFYWlZHWUFVTFJFTjMmZW5jcnlwdGVkSWQ9QTA0MTA4OTkxMUZFUFVQSTNDWVlLJmVuY3J5cHRlZEFkSWQ9QTA0MzQwODAzMU1TNjZDWjZPU1NKJndpZGdldE5hbWU9c3BfYXRmX25leHQmYWN0aW9uPWNsaWNrUmVkaXJlY3QmZG9Ob3RMb2dDbGljaz10cnVl&th=1&psc=1"
    )
    
    let fishingHigh1 = Present(
        image: "https://m.media-amazon.com/images/I/61bnFb1LgyL._AC_SX679_.jpg",
        link: "https://www.amazon.com/Moonlit-S-Glass-Fiberglass-Fly-Fishing/dp/B07X1T9GFJ/ref=sr_1_62?c=ts&keywords=Fishing%2BRods&qid=1683432456&refinements=p_36%3A10000-&rnid=386589011&s=hunting-fishing&sr=1-62&ts_id=3409871&th=1"
    )
    
    let fishingHigh2 = Present(
        image: "https://m.media-amazon.com/images/I/515UOK1x9EL._AC_SX679_.jpg",
        link: "https://www.amazon.com/Redington-Strike-Fishing-Medium-4-Pieces/dp/B0BSB5SRFL/ref=sr_1_69?c=ts&keywords=Fishing%2BRods&qid=1683432456&refinements=p_36%3A10000-&rnid=386589011&s=hunting-fishing&sr=1-69&ts_id=3409871&th=1&psc=1"
    )
    
    let fishingHigh3 = Present(
        image: "https://m.media-amazon.com/images/I/81sgT96mwJL._AC_SX679_.jpg",
        link: "https://www.amazon.com/Moonshine-Rod-Revival-Fishing-Fiberglass/dp/B079GB4Y1T/ref=sr_1_56?c=ts&keywords=Fishing+Rods&qid=1683432456&refinements=p_36%3A10000-&rnid=386589011&s=hunting-fishing&sr=1-56&ts_id=3409871"
    )
    
    // Football
    let footballLow1 = Present(
        image: "https://m.media-amazon.com/images/I/71c4bdTsmNL._AC_SX679_.jpg",
        link: "https://www.amazon.com/Wilson-Traditional-Soccer-Ball-3/dp/B08KSJV7Z9/ref=sr_1_23?crid=MC0X4VJ8OKHL&keywords=soccer%2Bsport&qid=1683432697&refinements=p_36%3A-5000&rnid=386589011&sprefix=soccer%2Bsport%2Caps%2C438&sr=8-23&th=1&psc=1"
    )
    
    let footballLow2 = Present(
        image: "https://m.media-amazon.com/images/I/51kP6aUntBL._AC_UX679_.jpg",
        link: "https://www.amazon.com/adidas-Youth-Parma-Shorts-Black/dp/B015SSVG3S/ref=sr_1_52?crid=MC0X4VJ8OKHL&keywords=soccer%2Bsport&qid=1683432792&refinements=p_36%3A-5000&rnid=386589011&sprefix=soccer%2Bsport%2Caps%2C438&sr=8-52&th=1"
    )
    
    let footballLow3 = Present(
        image: "https://m.media-amazon.com/images/I/915k7JyNxOL._AC_SX679_.jpg",
        link: "https://www.amazon.com/adidas-Stadium-Sports-Backpack-Black/dp/B091D5734P/ref=sr_1_48?crid=MC0X4VJ8OKHL&keywords=soccer%2Bsport&qid=1683432792&refinements=p_36%3A-5000&rnid=386589011&sprefix=soccer%2Bsport%2Caps%2C438&sr=8-48&th=1"
    )
    
    let footballMed1 = Present(
        image: "https://m.media-amazon.com/images/I/51Tj5INtjLL._AC_SX679_.jpg",
        link: "https://www.amazon.com/IILEVEN-Soccer-Goalkeeper-Gloves-Fingersaves/dp/B09SS7BCVH/ref=sr_1_16?crid=MC0X4VJ8OKHL&keywords=soccer%2Bsport&qid=1683432932&refinements=p_36%3A1253557011&rnid=386589011&s=sporting-goods&sprefix=soccer%2Bsport%2Caps%2C438&sr=1-16&th=1&psc=1"
    )
    
    let footballMed2 = Present(
        image: "https://m.media-amazon.com/images/I/7111-tCQ-5L._AC_SX679_PIcountsize-6,TopRight,0,0_SH20_.jpg",
        link: "https://www.amazon.com/Hicarer-Football-Linesman-Accessory-Teenager/dp/B0BNQ1KM8Q/ref=sr_1_23?crid=MC0X4VJ8OKHL&keywords=soccer+sport&qid=1683432980&refinements=p_36%3A1253557011&rnid=386589011&s=sporting-goods&sprefix=soccer+sport%2Caps%2C438&sr=1-23"
    )
    
    let footballMed3 = Present(
        image: "https://m.media-amazon.com/images/I/61x0WTchWML._AC_UY695_.jpg",
        link: "https://www.amazon.com/RUNWAY-Athletic-Professional-Training-Synthetic/dp/B08XWJ1Z52/ref=sr_1_40_sspa?crid=MC0X4VJ8OKHL&keywords=soccer%2Bsport&qid=1683433056&refinements=p_36%3A1253557011&rnid=386589011&s=sporting-goods&sprefix=soccer%2Bsport%2Caps%2C438&sr=1-40-spons&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUFJVFhCUFFGMVAyQjkmZW5jcnlwdGVkSWQ9QTAwNzI5MjYxSkhXV1NJTlZXVzI4JmVuY3J5cHRlZEFkSWQ9QTAyNzcwODIzVVhLTVpNSFJSSTFEJndpZGdldE5hbWU9c3BfbXRmJmFjdGlvbj1jbGlja1JlZGlyZWN0JmRvTm90TG9nQ2xpY2s9dHJ1ZQ&th=1&psc=1"
    )
    
    let footballHigh1 = Present(
        image: "https://m.media-amazon.com/images/I/61lb7-zrX9L._AC_UY879_.jpg",
        link: "https://www.amazon.com/adidas-Combat-Sports-Winter-Parka/dp/B08PH8D95T/ref=sr_1_10?crid=MC0X4VJ8OKHL&keywords=soccer%2Bsport&qid=1683433136&refinements=p_36%3A10000-&rnid=386589011&s=sporting-goods&sprefix=soccer%2Bsport%2Caps%2C438&sr=1-10&th=1&psc=1"
    )
    
    let footballHigh2 = Present(
        image: "https://m.media-amazon.com/images/I/613Dmhn4ltL._AC_SX679_.jpg",
        link: "https://www.amazon.com/Adidas-Rihla-World-Match-Orange/dp/B09X1Z69HG/ref=sr_1_4?crid=ZKH9G93EU6TK&keywords=soccer&qid=1683433211&refinements=p_36%3A10000-&rnid=386589011&sprefix=soccer%2Caps%2C468&sr=8-4"
    )
    
    let footballHigh3 = Present(
        image: "https://m.media-amazon.com/images/I/71sWSGOsKrL._AC_UX679_.jpg",
        link: "https://www.amazon.com/PUMA-2021-22-Milan-Replica-Jersey/dp/B099NT63BV/ref=sr_1_182?crid=ZKH9G93EU6TK&keywords=soccer&qid=1683433314&refinements=p_36%3A10000-&rnid=386589011&sprefix=soccer%2Caps%2C468&sr=8-182&th=1&psc=1"
    )
    
    // Video Games
    let gamingLow1 = Present(
        image: "https://m.media-amazon.com/images/I/61-FyZqWzdL._AC_SX679_.jpg",
        link: "https://www.amazon.com/MODS-GAMING-Console-Handheld-Gamepad/dp/B09N3MNRKM/ref=sr_1_2?keywords=video%2Bgaming&qid=1683433420&refinements=p_36%3A-5000&rnid=2661611011&sprefix=video%2Bgamin%2Caps%2C485&sr=8-2&th=1"
    )
    
    let gamingLow2 = Present(
        image: "https://m.media-amazon.com/images/I/61DtWA16YjL._AC_UX679_.jpg",
        link: "https://www.amazon.com/PinMart-Gaming-Original-Controller-Enamel/dp/B06XRS2PMK/ref=sr_1_12?keywords=video+gaming&qid=1683433458&refinements=p_36%3A-5000&rnid=2661611011&sprefix=video+gamin%2Caps%2C485&sr=8-12"
    )
    
    let gamingLow3 = Present(
        image: "https://m.media-amazon.com/images/I/613ZxWuyG8L._AC_SX679_.jpg",
        link: "https://www.amazon.com/EasySMX-Wireless-Joystick-Controller-Vibration/dp/B07WBYFX24/ref=sr_1_38?keywords=video%2Bgaming&qid=1683433458&refinements=p_36%3A-5000&rnid=2661611011&sprefix=video%2Bgamin%2Caps%2C485&sr=8-38&th=1"
    )
    
    let gamingMed1 = Present(
        image: "https://m.media-amazon.com/images/I/61-PIBx43BL._AC_SX679_.jpg",
        link: "https://www.amazon.com/RX-550-Computer-Graphics-DisplayPort/dp/B08VHWFWSD/ref=sr_1_1?keywords=video+gaming&qid=1683433592&refinements=p_36%3A5000-10000&rnid=2661611011&sprefix=video+gamin%2Caps%2C485&sr=8-1"
    )
    
    let gamingMed2 = Present(
        image: "https://m.media-amazon.com/images/I/61dwuOuWXmL._AC_SX679_.jpg",
        link: "https://www.amazon.com/Razer-Kraken-Tournament-Gel-Infused-Cushions/dp/B07G5TP4BN/ref=sr_1_2?keywords=video%2Bgaming&qid=1683433592&refinements=p_36%3A5000-10000&rnid=2661611011&sprefix=video%2Bgamin%2Caps%2C485&sr=8-2&th=1"
    )
    
    let gamingMed3 = Present(
        image: "https://m.media-amazon.com/images/I/51nMbPv+UIL._AC_SX679_.jpg",
        link: "https://www.amazon.com/Handheld-Consoles-Emulator-Hand-held-Preinstalled/dp/B0BPQXRC39/ref=sr_1_8?keywords=video%2Bgaming&qid=1683433592&refinements=p_36%3A5000-10000&rnid=2661611011&sprefix=video%2Bgamin%2Caps%2C485&sr=8-8&th=1"
    )
    
    let gamingHigh1 = Present(
        image: "https://m.media-amazon.com/images/I/71NEVzTJR7L._SX522_.jpg",
        link: "https://www.amazon.com/Logitech-Gaming-Handheld-Official-Carrying-Bundle/dp/B0BQN29T3J/ref=sr_1_37?keywords=video+gaming&qid=1683433723&refinements=p_36%3A10000-&rnid=2661611011&sprefix=video+gamin%2Caps%2C485&sr=8-37"
    )
    
    let gamingHigh2 = Present(
        image: "https://m.media-amazon.com/images/I/71pIS8f417L._AC_SX679_.jpg",
        link: "https://www.amazon.com/Nintendo-SwitchTM-Neon-Blue-Joy%E2%80%91ConTM-Switch/dp/B0BFJWCYTL/ref=sr_1_44?keywords=video%2Bgaming&qid=1683433723&refinements=p_36%3A10000-&rnid=2661611011&sprefix=video%2Bgamin%2Caps%2C485&sr=8-44&th=1"
    )
    
    let gamingHigh3 = Present(
        image: "https://m.media-amazon.com/images/I/41Mul3w+wvL._AC_.jpg",
        link: "https://www.amazon.com/Sony-Playstation-Portable-Handheld-Lavender/dp/B07VF2NJC2/ref=sr_1_59?keywords=video%2Bgaming&qid=1683433723&refinements=p_36%3A10000-&rnid=2661611011&sprefix=video%2Bgamin%2Caps%2C485&sr=8-59&th=1"
    )
    
    // Jewelry
    let jewelryLow1 = Present(
        image: "https://m.media-amazon.com/images/I/512f35r87xL._AC_UX679_.jpg",
        link: "https://www.amazon.com/Naixio-Necklaces-Girlfriend-Anniversary-Valentines/dp/B0BZS1XWKB/ref=sr_1_12_sspa?crid=2FCFPXKQJ9XJW&keywords=jewelry&qid=1683433911&refinements=p_36%3A-5000&rnid=2661611011&sprefix=jewelry%2Caps%2C563&sr=8-12-spons&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUE5QUpFV04yMENWVVUmZW5jcnlwdGVkSWQ9QTAwNjk3NDYxS1haWDBUNkszR1dSJmVuY3J5cHRlZEFkSWQ9QTAwOTI4MDIxMlFYQk5QVUIwN1dCJndpZGdldE5hbWU9c3BfbXRmJmFjdGlvbj1jbGlja1JlZGlyZWN0JmRvTm90TG9nQ2xpY2s9dHJ1ZQ&th=1"
    )
    
    let jewelryLow2 = Present(
        image: "https://m.media-amazon.com/images/I/61N2do-26ML._AC_UY695_.jpg",
        link: "https://www.amazon.com/PAVOI-White-Plated-Zirconia-Stackable/dp/B08CT6BKDY/ref=sr_1_30?crid=2FCFPXKQJ9XJW&keywords=jewelry&qid=1683433944&refinements=p_36%3A-5000&rnid=2661611011&sprefix=jewelry%2Caps%2C563&sr=8-30&th=1"
    )
    
    let jewelryLow3 = Present(
        image: "https://m.media-amazon.com/images/I/71xC0O4sqPL._AC_UX679_.jpg",
        link: "https://www.amazon.com/Benevolence-Gold-Mama-Necklace-Mom-Necklaces/dp/B08B7VC3PF/ref=sr_1_37?crid=2FCFPXKQJ9XJW&keywords=jewelry&qid=1683433944&refinements=p_36%3A-5000&rnid=2661611011&sprefix=jewelry%2Caps%2C563&sr=8-37&th=1"
    )
    
    let jewelryMed1 = Present(
        image: "https://m.media-amazon.com/images/I/71mQmVmjP2L._AC_UY879_.jpg",
        link: "https://www.amazon.com/SILVERKITY-Birthstone-Anniversary-Valentines-Girlfriends/dp/B09YGZQBTJ/ref=sr_1_3_sspa?crid=2FCFPXKQJ9XJW&keywords=jewelry&qid=1683434018&refinements=p_36%3A2661614011&rnid=2661611011&s=apparel&sprefix=jewelry%2Caps%2C563&sr=1-3-spons&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEzSlBKTEUyRklVN0xMJmVuY3J5cHRlZElkPUExMDMyOTk0M0hER082Vk5UUE43RSZlbmNyeXB0ZWRBZElkPUEwNDUzODIwMTZNRzZNNktOQ0dNViZ3aWRnZXROYW1lPXNwX2F0ZiZhY3Rpb249Y2xpY2tSZWRpcmVjdCZkb05vdExvZ0NsaWNrPXRydWU&th=1"
    )
    
    let jewelryMed2 = Present(
        image: "https://m.media-amazon.com/images/I/51KWkVJ5vjL._AC_UY695_.jpg",
        link: "https://www.amazon.com/Kendra-Scott-Addison-Multi-Strand/dp/B08LC8436F/ref=sr_1_17?crid=2FCFPXKQJ9XJW&keywords=jewelry&qid=1683434018&refinements=p_36%3A2661614011&rnid=2661611011&s=apparel&sprefix=jewelry%2Caps%2C563&sr=1-17&th=1"
    )
    
    let jewelryMed3 = Present(
        image: "https://m.media-amazon.com/images/I/81V-dXDSspL._AC_UY695_.jpg",
        link: "https://www.amazon.com/Michael-Kors-Fulton-Bangle-Bracelet/dp/B00KDRIC5K/ref=sr_1_27?crid=2FCFPXKQJ9XJW&keywords=jewelry&qid=1683434018&refinements=p_36%3A2661614011&rnid=2661611011&s=apparel&sprefix=jewelry%2Caps%2C563&sr=1-27&th=1"
    )
    
    let jewelryHigh1 = Present(
        image: "https://m.media-amazon.com/images/I/61Dls7igfdL._AC_UY695_.jpg",
        link: "https://www.amazon.com/Swarovski-Millenia-Necklace-Earring-Rhodium/dp/B09LRNJ91J/ref=sr_1_36?crid=2FCFPXKQJ9XJW&keywords=jewelry&qid=1683434139&refinements=p_36%3A10000-&rnid=2661611011&s=apparel&sprefix=jewelry%2Caps%2C563&sr=1-36"
    )
    
    let jewelryHigh2 = Present(
        image: "https://m.media-amazon.com/images/I/41YhrmuqHdL._AC_UY695_.jpg",
        link: "https://www.amazon.com/Kendra-Scott-Pendant-Necklace-Vermeil/dp/B09QGGQDDQ/ref=sr_1_48?crid=2FCFPXKQJ9XJW&keywords=jewelry&qid=1683434139&refinements=p_36%3A10000-&rnid=2661611011&s=apparel&sprefix=jewelry%2Caps%2C563&sr=1-48&th=1"
    )
    
    let jewelryHigh3 = Present(
        image: "https://m.media-amazon.com/images/I/81zqJ+-0Z2L._AC_UY695_.jpg",
        link: "https://www.amazon.com/Yellow-Gold-Filled-Hand-Engraved-Bracelet/dp/B003H9LHKI/ref=sr_1_56?crid=2FCFPXKQJ9XJW&keywords=jewelry&qid=1683434139&refinements=p_36%3A10000-&rnid=2661611011&s=apparel&sprefix=jewelry%2Caps%2C563&sr=1-56"
    )
    
    // Anime
    let animeLow1 = Present(
        image: "https://m.media-amazon.com/images/I/611RhTJAPgL._AC_UX679_.jpg",
        link: "https://www.amazon.com/Leather-Adjustable-Chains-Nightclub-Accessories/dp/B0B2QQD2R4/ref=sr_1_86?crid=1DK2HTTTLEJ0A&keywords=anime&qid=1683434355&refinements=p_36%3A2661613011&rnid=2661611011&s=apparel&sprefix=an%2Cfashion-womens-jewelry%2C407&sr=1-86&th=1"
    )
    
    let animeLow2 = Present(
        image: "https://m.media-amazon.com/images/I/71FkLA3-TUL._AC_UX679_.jpg",
        link: "https://www.amazon.com/MARSALIA-6-Pairs-One-Piece-Anime-Earrings-for-Women-Men-Stud-Earring-set-1/dp/B09YGXSTVJ/ref=sr_1_37?crid=1DK2HTTTLEJ0A&keywords=anime&qid=1683434270&refinements=p_36%3A-5000&rnid=2661611011&s=apparel&sprefix=an%2Cfashion-womens-jewelry%2C407&sr=1-37"
    )
    
    let animeLow3 = Present(
        image: "https://m.media-amazon.com/images/I/51JXhpeSY6L._AC_UX679_.jpg",
        link: "https://www.amazon.com/Orange-Chainsaw-Anime-Earrings-Accessory/dp/B0BK8VTK94/ref=sr_1_23?crid=1DK2HTTTLEJ0A&keywords=anime&qid=1683434270&refinements=p_36%3A-5000&rnid=2661611011&s=apparel&sprefix=an%2Cfashion-womens-jewelry%2C407&sr=1-23"
    )
    
    let animeMed1 = Present(
        image: "https://m.media-amazon.com/images/I/71LBcavmLcL._AC_UX679_.jpg",
        link: "https://www.amazon.com/Bona-Fide-Premium-Quality-Leggings/dp/B0BK2TQV9K/ref=sr_1_42?crid=UJ1W1NHNOUMA&keywords=anime+clothes&qid=1683434589&refinements=p_36%3A2661614011&rnid=2661611011&s=apparel&sprefix=anime+%2Caps%2C333&sr=1-42"
    )
    
    let animeMed2 = Present(
        image: "https://m.media-amazon.com/images/I/51K3GfUzO3L._SX410_BO1,204,203,200_.jpg",
        link: "https://www.amazon.com/Silent-Voice-Complete-Box-Set/dp/1632366436/ref=sr_1_63?crid=3E24832U0SZTK&keywords=anime+manga&qid=1683434743&sprefix=anime+manga%2Caps%2C496&sr=8-63"
    )
    
    let animeMed3 = Present(
        image: "https://m.media-amazon.com/images/I/71u5zxpYvcL._AC_SX679_.jpg",
        link: "https://www.amazon.com/Anime-Playing-Decor-e00120-2-6x4-9/dp/B09W2V4GMQ/ref=sr_1_7?crid=S85M0Q7FT6YE&keywords=anime%2Bdecor&qid=1683434810&refinements=p_36%3A1253525011&rnid=386465011&s=home-garden&sprefix=anime%2Caps%2C338&sr=1-7&th=1"
    )
    
    let animeHigh1 = Present(
        image: "https://m.media-amazon.com/images/I/61S0CTJ0APS._AC_SX679_.jpg",
        link: "https://www.amazon.com/FARNEW-Decorations-Bedroom-Windows-Birthday/dp/B092LCGLQL/ref=sr_1_5?crid=S85M0Q7FT6YE&keywords=anime+decor&qid=1683434860&refinements=p_36%3A10000-&rnid=386465011&s=home-garden&sprefix=anime%2Caps%2C338&sr=1-5"
    )
    
    let animeHigh2 = Present(
        image: "https://m.media-amazon.com/images/I/71CbR+B201L._AC_SX679_.jpg",
        link: "https://www.amazon.com/Chainsaw-Man-Poster-Character-Painting/dp/B0B2DDHQZJ/ref=sr_1_6?crid=S85M0Q7FT6YE&keywords=anime%2Bdecor&qid=1683434860&refinements=p_36%3A10000-&rnid=386465011&s=home-garden&sprefix=anime%2Caps%2C338&sr=1-6&th=1"
    )
    
    let animeHigh3 = Present(
        image: "https://m.media-amazon.com/images/I/811xMqmbi0L._AC_SY879_.jpg",
        link: "https://www.amazon.com/Bandai-Tamashii-Nations-Mazinger-Chogokin/dp/B01L8S3J96/ref=sr_1_49?crid=5MY63Y6SYZY6&keywords=anime+toys&qid=1683434892&refinements=p_36%3A10000-&rnid=386491011&sprefix=anime%2Caps%2C382&sr=8-49"
    )
    
    // Sport
    let sportLow1 = Present(
        image: "https://m.media-amazon.com/images/I/61DbJgZ8JYL._AC_UY879_.jpg",
        link: "https://www.amazon.com/OQQ-Support-Seamless-Removable-Workout/dp/B09PZSX63C/ref=sr_1_3?keywords=sport+accessories+for+women&qid=1683435044&refinements=p_36%3A-5000&rnid=2661611011&sprefix=sport+accessories+for+%2Caps%2C403&sr=8-3"
    )
    
    let sportLow2 = Present(
        image: "https://m.media-amazon.com/images/I/7159HGMboKL._AC_SX679_.jpg",
        link: "https://www.amazon.com/Jesries-Headbands-SweatBands-Accessory-Absorbsion/dp/B0BWQCSSWZ/ref=sr_1_15?keywords=sport+accessories+for+women&qid=1683435044&refinements=p_36%3A-5000&rnid=2661611011&sprefix=sport+accessories+for+%2Caps%2C403&sr=8-15"
    )
    
    let sportLow3 = Present(
        image: "https://m.media-amazon.com/images/I/61VbcGeGPdL._AC_UX679_.jpg",
        link: "https://www.amazon.com/Fabbay-Mirrored-Sunglasses-Rimless-Glasses/dp/B0BR3VZRMV/ref=sr_1_28_sspa?keywords=sport%2Baccessories%2Bfor%2Bwomen&qid=1683435044&refinements=p_36%3A-5000&rnid=2661611011&sprefix=sport%2Baccessories%2Bfor%2B%2Caps%2C403&sr=8-28-spons&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUFFUkNSMTg0UDlJRlImZW5jcnlwdGVkSWQ9QTEwNDI2ODIxSlI0R1c0TE5IRU5GJmVuY3J5cHRlZEFkSWQ9QTAzNDgzMTMzTVJUQUFUWEFXMkhUJndpZGdldE5hbWU9c3BfbXRmJmFjdGlvbj1jbGlja1JlZGlyZWN0JmRvTm90TG9nQ2xpY2s9dHJ1ZQ&th=1"
    )
    
    let sportMed1 = Present(
        image: "https://m.media-amazon.com/images/I/7125bAihAnL._AC_UX695_.jpg",
        link: "https://www.amazon.com/Skechers-Womens-Drive-Spikeless-White/dp/B07XHC1QRH/ref=sr_1_36?keywords=sport%2Baccessories%2Bfor%2Bwomen&qid=1683435136&refinements=p_36%3A2661614011&rnid=2661611011&s=apparel&sprefix=sport%2Baccessories%2Bfor%2B%2Caps%2C403&sr=1-36&th=1&psc=1"
    )
    
    let sportMed2 = Present(
        image: "https://m.media-amazon.com/images/I/71JBB+55G8L._AC_UX679_.jpg",
        link: "https://www.amazon.com/Gordini-Womens-Standard-Gauntlet-Gunmetal/dp/B08GH2T1VK/ref=sr_1_105?keywords=sport%2Baccessories%2Bfor%2Bwomen&qid=1683435197&refinements=p_36%3A2661614011&rnid=2661611011&s=apparel&sprefix=sport%2Baccessories%2Bfor%2B%2Caps%2C403&sr=1-105&th=1&psc=1"
    )
    
    let sportMed3 = Present(
        image: "https://m.media-amazon.com/images/I/61G2UHfxq5L._AC_UX679_.jpg",
        link: "https://www.amazon.com/Arena-Standard-MaxLife-Swimsuit-Navy-Multi/dp/B085PN2JBP/ref=sr_1_152?keywords=sport%2Baccessories%2Bfor%2Bwomen&qid=1683435280&refinements=p_36%3A2661614011&rnid=2661611011&s=apparel&sprefix=sport%2Baccessories%2Bfor%2B%2Caps%2C403&sr=1-152&th=1&psc=1"
    )
    
    let sportHigh1 = Present(
        image: "https://m.media-amazon.com/images/I/419KAkxANwL._AC_SX679_.jpg",
        link: "https://www.amazon.com/Elastic-Lifting-Leggings-Control-Bottoms/dp/B0B6QMR66T/ref=sr_1_5?crid=L994XS6WUGB0&keywords=sport%2Bfor%2Bwomen&qid=1683435339&refinements=p_36%3A10000-&rnid=2661611011&sprefix=sport%2Bfor%2Bwomen%2Caps%2C377&sr=8-5&th=1"
    )
    
    let sportHigh2 = Present(
        image: "https://m.media-amazon.com/images/I/71cT+iIFbNL._AC_UX679_.jpg",
        link: "https://www.amazon.com/Nike-Womens-Quilted-Jacket-Medium/dp/B09LC2G8MJ/ref=sr_1_27_sspa?crid=L994XS6WUGB0&keywords=sport+for+women&qid=1683435339&refinements=p_36%3A10000-&rnid=2661611011&sprefix=sport+for+women%2Caps%2C377&sr=8-27-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUExWkU0RVZBQU82M0tFJmVuY3J5cHRlZElkPUEwNjg5OTc1MlVaSldHVzMwUFJWRCZlbmNyeXB0ZWRBZElkPUEwOTYxMTQ4UkRJR05SM1REMTdJJndpZGdldE5hbWU9c3BfbXRmJmFjdGlvbj1jbGlja1JlZGlyZWN0JmRvTm90TG9nQ2xpY2s9dHJ1ZQ=="
    )
    
    let sportHigh3 = Present(
        image: "https://m.media-amazon.com/images/I/814bnyj7wEL._AC_UX679_.jpg",
        link: "https://www.amazon.com/Helly-Hansen-Womens-Hooded-X-Large/dp/B07F2S3WGN/ref=sr_1_57?crid=L994XS6WUGB0&keywords=sport+for+women&qid=1683435339&refinements=p_36%3A10000-&rnid=2661611011&sprefix=sport+for+women%2Caps%2C377&sr=8-57"
    )
}
