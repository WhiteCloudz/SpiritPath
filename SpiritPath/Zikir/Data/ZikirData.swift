//
//  File.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 31.08.2023.
//

import Foundation
import UIKit

class ZikirData{
    
    var ZikirName:String
    var ZikirDescription:String
    var ZikirRecomend:String
    var ZikirToday:String
    var SavedDate:String
    var ZikirTotal:String
    var ZikirControl:String?
   
    
    init(ZikirName: String, ZikirDescription: String, ZikirRecomend:String, ZikirToday: String, SavedDate:String, ZikirTotal: String, ZikirControl:String) {
        self.ZikirName = ZikirName
        self.ZikirDescription = ZikirDescription
        self.ZikirRecomend = ZikirRecomend
        self.ZikirToday = ZikirToday
        self.SavedDate = SavedDate
        self.ZikirTotal = ZikirTotal
        self.ZikirControl = ZikirControl
    }

}

   var asmaList: [ZikirData] = [
    ZikirData(ZikirName: "Allah (cc)", ZikirDescription: Allah, ZikirRecomend: "66", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Ar-Rahman", ZikirDescription:ArRahman , ZikirRecomend: "298", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Ar-Rahim", ZikirDescription: ArRahim , ZikirRecomend: "258", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Malik", ZikirDescription:AlMalik , ZikirRecomend: "90", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Quddus", ZikirDescription:AlQuddus , ZikirRecomend: "174", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "As-Selam", ZikirDescription: AsSalam , ZikirRecomend: "131", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Mu'Min", ZikirDescription:AlMumin , ZikirRecomend: "131", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Muhaymin", ZikirDescription:AlMuhaymin , ZikirRecomend: "145", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-'Aziz", ZikirDescription: AlAziz , ZikirRecomend: "94", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Jabbar", ZikirDescription: AlJabbar, ZikirRecomend: "208", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "AI-Mutakabbir", ZikirDescription:AlMutakabbir , ZikirRecomend: "664", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Khaliq", ZikirDescription: AlKhaliq , ZikirRecomend: "731", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Bari'", ZikirDescription: AlBari, ZikirRecomend: "204", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Musawwir", ZikirDescription: AlGhaffar , ZikirRecomend: "242", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName:  "Al-Ghaffar", ZikirDescription:AlMusawwir , ZikirRecomend: "136", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Qahhar", ZikirDescription: AlQahhar, ZikirRecomend: "311", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName:  "Al-Wahhab", ZikirDescription:  AlWahhab , ZikirRecomend: "19", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName:  "Ar-Razzaq", ZikirDescription:ArRazzaq, ZikirRecomend: "315", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Fattah", ZikirDescription:AlFattah , ZikirRecomend: "889", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-'Alim", ZikirDescription:AlAlim , ZikirRecomend: "150", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Qabid", ZikirDescription: AlQabid, ZikirRecomend: "72", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Basit", ZikirDescription:AlBasit , ZikirRecomend: "903", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Khafid", ZikirDescription:AlKhafid , ZikirRecomend: "1481", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Ar-Rafı’", ZikirDescription: ArRafi , ZikirRecomend: "351", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName:  "Al-Mu'izz", ZikirDescription:AlMuizz, ZikirRecomend: "124", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "AI-Muzil", ZikirDescription: AlMuzil, ZikirRecomend: "800", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "As-Sami'", ZikirDescription: AsSami, ZikirRecomend: "180", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Basir", ZikirDescription:AlBasir, ZikirRecomend: "302", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Hakam", ZikirDescription:AlHakam , ZikirRecomend: "68", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "AI-'AdI", ZikirDescription:AlAdI, ZikirRecomend: "104", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Latif", ZikirDescription: AlLatif, ZikirRecomend: "129", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Khabir", ZikirDescription: AlKhabir, ZikirRecomend: "812", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName:  "Al-Halim", ZikirDescription: AlHalim, ZikirRecomend: "88", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-'Azim", ZikirDescription: AlAzim, ZikirRecomend: "1020", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName:  "Al-Ghafur", ZikirDescription: AlGhafur , ZikirRecomend: "1286", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Ash-Shakur", ZikirDescription: AshShakur, ZikirRecomend: "526", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-'Aliyy", ZikirDescription:AlAliyy, ZikirRecomend: "120", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Kabir", ZikirDescription:AlKabir, ZikirRecomend: "232", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Hafiz", ZikirDescription: AlHafiz, ZikirRecomend: "998", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Muqit", ZikirDescription: AlMuqit, ZikirRecomend: "550", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Hasib", ZikirDescription: AlHasib, ZikirRecomend: "80", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Jalil", ZikirDescription: AlJalil, ZikirRecomend: "73", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Karim", ZikirDescription: AlKarim, ZikirRecomend: "270", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Ar-Raqib", ZikirDescription: ArRaqib, ZikirRecomend: "312", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Mujib", ZikirDescription:AlMujib , ZikirRecomend: "55", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Wasi", ZikirDescription:AIWasi , ZikirRecomend: "137", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Hakim", ZikirDescription: AlHakim, ZikirRecomend: "78", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Wadud", ZikirDescription: AlWadud, ZikirRecomend: "20", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Majeed", ZikirDescription:AlMajeed , ZikirRecomend: "57", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Bais", ZikirDescription: AlBais, ZikirRecomend: "573", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Ash-Shahid", ZikirDescription: AshShahid, ZikirRecomend: "319", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Haqq", ZikirDescription:AlHaqa , ZikirRecomend: "208", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Wakil", ZikirDescription: AlWakil, ZikirRecomend: "66", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Qawiyy", ZikirDescription: AlQawiyy, ZikirRecomend: "126", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Matin", ZikirDescription: AlMatin, ZikirRecomend: "500", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName:  "Al-Waliyy", ZikirDescription:AlWaliyy , ZikirRecomend: "56", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName:  "Al-Hamid", ZikirDescription:AlHamid , ZikirRecomend: "62", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Muhsi", ZikirDescription: AlMuhsi , ZikirRecomend: "48", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Mubdi'", ZikirDescription:AlMubdi , ZikirRecomend: "47", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Mu'id", ZikirDescription:AlMuid , ZikirRecomend: "124", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Mumit", ZikirDescription: AlMumit, ZikirRecomend: "490", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Hayy", ZikirDescription: AlHayy, ZikirRecomend: "28", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Qayyum", ZikirDescription:AlQayyum , ZikirRecomend: "166", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Wajid", ZikirDescription: AlWajid, ZikirRecomend: "14", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Maajid", ZikirDescription:AlMaajid , ZikirRecomend: "48", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Wahid", ZikirDescription: AlWahid, ZikirRecomend: "19", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "As-Samad", ZikirDescription: AsSamad, ZikirRecomend: "134", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Qadir", ZikirDescription: AlQadir, ZikirRecomend: "314", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Muqtadir", ZikirDescription:AlMuqtadir , ZikirRecomend: "744", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Muqaddim", ZikirDescription: AlMuqaddim, ZikirRecomend: "188", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Muakhkhir", ZikirDescription: AlMuakhkhir , ZikirRecomend: "1441", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Awwal", ZikirDescription:AlAwwal , ZikirRecomend: "43", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Akhir", ZikirDescription: AlAkhir, ZikirRecomend: "801", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Az-Zahir", ZikirDescription:AzZahir , ZikirRecomend: "1106", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Batin", ZikirDescription: AlBatin, ZikirRecomend: "62", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Waali", ZikirDescription:AIWaali, ZikirRecomend: "47", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Muta'ali", ZikirDescription:AlMutaali , ZikirRecomend: "551", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Barr", ZikirDescription: AlBarr, ZikirRecomend: "402", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "At-Tawwab", ZikirDescription: AtTawwab, ZikirRecomend: "415", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Muntaqim", ZikirDescription: AlMuntaqim, ZikirRecomend: "630", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "AI-Afuww", ZikirDescription: AlAfuww, ZikirRecomend: "162", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Ar-Rauf", ZikirDescription: ArRauf , ZikirRecomend: "281", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Malikul-Mulk", ZikirDescription:MalikulMulk , ZikirRecomend: "212", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Zul-Jalali wal-Ikram", ZikirDescription: ZulJalaliwalIkram, ZikirRecomend: "1100", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Muqsit", ZikirDescription: AlMuqsit, ZikirRecomend: "209", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Jami'", ZikirDescription:AlJami , ZikirRecomend: "114", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Ghaniyy", ZikirDescription: AlGhaniyy, ZikirRecomend: "1070", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Mughniyy", ZikirDescription:AlMughniyy , ZikirRecomend: "110", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Mani'", ZikirDescription: AlMani, ZikirRecomend: "161", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Ad-Darr", ZikirDescription:AdDarr , ZikirRecomend: "1201", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "An-Nafi'", ZikirDescription:AnNafi , ZikirRecomend: "201", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "An-Nur", ZikirDescription:AnNur , ZikirRecomend: "256", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Hadi", ZikirDescription: AlHadi, ZikirRecomend: "20", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName:  "Al-Badi'", ZikirDescription:AlBadi , ZikirRecomend: "86", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Baqi", ZikirDescription:AlBaqi , ZikirRecomend: "113", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Al-Waris", ZikirDescription: AlWaris, ZikirRecomend: "707", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "Ar-Rashid", ZikirDescription: ArRashid , ZikirRecomend: "514", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma"),
    ZikirData(ZikirName: "As-Sabur", ZikirDescription: AsSabur, ZikirRecomend: "298", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Asma")
    
    ]

var recomendList: [ZikirData] = [
    ZikirData(ZikirName: "Salli Ala Muhammed", ZikirDescription: "", ZikirRecomend: "0", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Zikir"),
    ZikirData(ZikirName: "Subuhanallah-i Vebihamdihi", ZikirDescription: "", ZikirRecomend: "0", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Zikir"),
    ZikirData(ZikirName: "Allahumme Bike Asbahna", ZikirDescription: "", ZikirRecomend: "0", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Zikir"),
    ZikirData(ZikirName: "Bismillahillezi La Yedurru", ZikirDescription: "", ZikirRecomend: "0", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Zikir"),
    ZikirData(ZikirName: "Allahumme Inni Eselukel", ZikirDescription: "", ZikirRecomend: "0", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Zikir"),
    ZikirData(ZikirName: "Emseyna/Emsel Mulki Lillah", ZikirDescription: "", ZikirRecomend: "0", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Zikir"),
    ZikirData(ZikirName: "Allahumme Einni Ala Zikrih", ZikirDescription: "", ZikirRecomend: "0", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Zikir"),
    ZikirData(ZikirName: "La Ilahe Illa Ente Subhanek", ZikirDescription: "" , ZikirRecomend: "0", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Zikir"),
    ZikirData(ZikirName: "Allahumme Inneke Afuvvun", ZikirDescription: "", ZikirRecomend: "0", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Zikir"),
    ZikirData(ZikirName: "Estafurullah El Azim", ZikirDescription: "", ZikirRecomend: "0", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Zikir"),
    ZikirData(ZikirName: "Asbahna/Asbahal Mulki Lillah", ZikirDescription: "", ZikirRecomend: "0", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Zikir"),
    ZikirData(ZikirName: "Surah-al Ihlas", ZikirDescription: "", ZikirRecomend: "0", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Zikir"),
    ZikirData(ZikirName: "Salatan Tefriciye", ZikirDescription: "", ZikirRecomend: "0", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Zikir"),
    ZikirData(ZikirName: "Sekine", ZikirDescription: " ", ZikirRecomend: "0", ZikirToday: "0", SavedDate: "", ZikirTotal: "0", ZikirControl: "Zikir")
]



let Allah =
"""
"Allah, God, One God
Allah is the most common name in the Qur'an and the most famous name of God in Islam. This name means that Allah is the only God and no one but Him is worthy of worship.
1/99
"""

let ArRahman = """
"The Gracious
means that Allah has unlimited mercy, which He shows to everyone, regardless of whether a person is a Muslim or not.
This name comes in conjunction with another great name "Ar-Rahim" in the phrase "Bismillahir-Rahmanir-Rahim", which in translation means: "In the name of Allah, The Gracious to all in this world and The Merciful only to believers in hereafter".
Ar-Rahman emphasizes here the breadth and greatness of Allah's mercy.
2 / 99
"""

let ArRahim = """
"The Merciful
Ar-Rahim  means that Allah will show His mercy on the Day of Judgment only to those who believed and were obedient to Him.
This name comes in conjunction with another great name "Ar-Rahman" in the phrase "Bismillahir-Rahmanir-Rahim", which in translation means: "In the name of Allah, The Gracious to all in this world and The Merciful only to the believers in hereafter"
Ar-Rahim emphasizes here the special mercy of Allah to the believers.
3/99
"""

let AlMalik =
"""
The King, The Lord
Allah as the King, who has absolute power over all creations. Allah is the absolute Ruler, Who has no partner in power.
He does not need anyone's help and disposes of everything created by Him as He wills, and at the same time no one can interfere with Him.
4 / 99
"""


let AlQuddus =
"""
The Holy, The Free from Flaws
Allah is Free from any flaws, vices and sins that are inherent in creations.
He is Inaccessible and Pure from everything that human can imagine about Him.
He is Higher than having those like Himself or similar to Himself.
5 / 99
"""

let AsSalam = """
The Giver of Peace and Security,
The Peacemaker
This name is similar in meaning to the name "Al-Quddus", since it also means that the essence of Allah is free from all shortcomings, vices and defects. He is Whole, Unharmed. Allah is the source of peace, harmony and prosperity for His creations.
He welcomes the believers in peace in Paradise and gives them security there.
6 / 99
"""



let AlMumin =
"""
The Faithful, The Reliable, The Giver of Faith
This name of Allah indicates that He is Faithful to the agreement with His slaves. For example, those who believe - Paradise, the atheists - Hell.
Also, this name means that only Allah gives faith to people, instilling it in their hearts. And He also gives reliability and security to His faithful servants.
7 / 99
"""

let AlMuhaymin =
"""
The Keeper, The Protector,
The Guardian
He is Aware of everything that His creations do and say, and He is the Carer of them all.
This name also means that Allah is the Guardian who provides peace and protection, in particular for believers.
8 / 99
"""


let AlAziz =
"""
The Mighty, The Great, The Conqueror
Tthere is no one more powerful than Allah. His power has already manifested itself in the creation of the universe, natural phenomena, people and their actions, helping the righteous, as well as all things.
His power has no limits, since He is Great.
9/99
"""


let AlJabbar =
"""
The Powerful, The Subduing, The Irresistible
Allah has strength, power and greatness. There is nothing and no one greater than Him.
Subordinating all the rest to His will.
Crushing tyrants and despots trying to encroach on His right or on the rights of His creatures.
10 / 99
"""


let AlMutakabbir =
"""
“The Proud, The Arrogant, The Superior
This name of Allah indicates that He is the only One who has the right to possess arrogance. Because all creations and created by Him are insignificant in compared with the essence of Allah.
He is Proud and does not allow anyone to claim creation and challenge His commands, power and will. He is the Only Possessor of true majesty.
11 / 99
"""


let AlKhaliq =
"""
The Creator, The Maker
This name explains that Allah is the One Who created absolutely everything that surrounds us: people, nature, the universe and in general everything that exists in real, without examples and archetypes.
Nothing was created without His will.
12 / 99
"""


let AlBari =
"""
The Creator from Nothing
This name is similar to the name
"Al-Khaliq", in translation: "The Creator, The Maker. But the meaning is emphasized: Creator from nothing and Creator without any effort.
Because it is enough for Him to say: "Be!" and whatever He wills happens.”
13 / 99
"""


let AlGhaffar =
"""
The Forgiving, The Hider of Sins Al-Ghaffar
This name means that Allah hides the sins of people and covers their shortcomings, which He can later forgive, regardless of the degree of fault, with the exception of polytheism, if no repentance was made in worldly life.
14 / 99
"""



let AlMusawwir =
"""
The Forming, The Shaper of Everything
It is Allah who gives various forms and images to His creations.
And in the womb of mothers it is He Who forms the fetus, giving it such a shape as wishes.
14 / 99
"""





let AlQahhar =
"""
The Dominator, The Destroyer
This name means that Allah tames all creations with His majesty and dominance. He makes everyone and everything submit to His greatness, regardless of whether they want it or no.
Allah is the Possessor of crushing power and might.
16 / 99
"""


let AlWahhab =
"""
The Giver, The Giver Gratuitously,
The Most Generous
Allah, by His generosity, daily and every second bestows countless blessings on His creations. And He is the Giver constantly, without waiting for the requests of people.
At the same time a huge number of blessings are given to us free of charge.
17 / 99
"""


let ArRazzaq =
"""
The Allocating with Livelihood, The Giver of goods and sustenance
This name emphasizes that it is Allah - the One Who endows everyone and everything with provision and livelihood, while doing it with generosity and abundance.
Under the inheritance (Arabic "rizk") means all kinds of goods, material and non-material.
18 / 99
"""


let AlFattah =
"""
The Opener, The Giver of Victory,
The Judge
Allah opens the hearts of people to know Him and love Him. He is the Facilitator and Resolver of all problems.
He is the Judge Who will judge between His servants all their questions.
19 /  99
"""

 
let AlAlim =
"""
The All-Knowing
This name of Allah indicates that He is Aware of everything that happened and what will happen. He knows the smallest detail of any issue and business, nothing hidden from His knowledge.
Yet He possesses knowledge that was neither preceded by ignorance nor followed by loss. His knowledge is perfect and absolute.
20/ 99
"""


let AlQabid =
"""
The Reducer, The Restrictor, The Taker of Souls
This name means that Allah reduces and limits the lot to whom He wills in His justice.
By the livelihood (Arabic "riza") means all kinds good, material and non-material. He is the Keeper of souls in His power, subjecting them to death, and He also takes the souls of the dead.
21 / 99
"""


let AlBasit =
"""
The Enlarger, The Distributor,
The Extender
This name means, He multiplies the lot of those whom He wishes.
Under the livelihood (Arabic "rizq") means all kinds of goods, material and non-material. At the same time, He generously gives blessings to all creatures.
He is the Spreader of souls in space and Expanding hearts according to His will.
22 / 99
"""



let AlKhafid =
"""
The Humiliator, The Overthrowing
Allah humiliates whom He wills. He humiliates all who have become wicked and rebelled against the truth. And He lowers the position and status, if He wishes.
23 / 99
"""



let ArRafi =
"""
The Elevator, The Uplifting
This name of Allah means that He exalts whomever He wishes by His mercy. In particular, those who believe, who are busy worshiping Him.
24/99
"""



let AlMuizz =
"""
The Strengthening, The Exalting,
The Giver of Power
This name means that Allah grants power, strength to whomever he wants. He exalts in the degrees of this world and the eternal whom He wishes.
25 / 99
"""



let AlMuzil =
"""
The One Who makes weaker, The Overthrowing, The Taker of Power
This name means that Allah deprives power, strength of whomever He wishes. Thus, belittling him, because He is Degrading. And He humiliates those who have become wicked.
26 / 99
"""



let AsSami =
"""
The All-Hearing
Allah hears absolutely everything: every whisper, every rustle of a blade of grass.
There is nothing He won't hear. The quietest and most secret is available to Him.
27 / 99
"""



let AlBasir =
"""
The All-Seeing
Allah sees everything that is obvious (open) and secret (hidden). The smallest things and details are available to His vision. There is nothing that He does not see.
28 / 99
"""




let AlHakam =
"""
The Judge, The Supreme Judge,
The Decisive
Allah is the Supreme Judge, whose decisions are always just in full, and decisions have power, because He is Decisive. And at the same time He judges His servants as He pleases.
One whose perfect wisdom no one can fully appreciate, and no one can fully understand His judgments!
29 / 99
"""



let AlAdI =
"""
The Fair, The Just
The decisions, deeds and order of Allah carry justice. He does not act unjustly and commands others to do the same. He is the Giver of what people deserve.
30 / 99
"""


let AlLatif =
"""
The Kind, The Insightful
This name means that Allah is Kind and Favorable to His creations. He knows about all the subtleties of the hidden, because He is the Insightful.
31 / 99
"""



let AlKhabir =
"""
The All-Knowing, The Aware
This name means that Allah knows absolutely everything that happens, happened and what will happen in the most detailed details.
He is the Knower of all things hidden and manifest.
And at the same time, nothing is added or decreased to His knowledge.
32 / 99
"""


let AlHalim =
"""
The Restrained, The Indulgent
Allah is not in a hurry to punish His slaves, despite the fact that many of those who disobey deserve it. On the contrary, He hides, and then forgives sins.
Moreover, Allah grants both the obedient and the disobedient to Him various kinds of blessings, because He is Forgiving.
33 /99
"""


let AlAzim =
"""
The Magnificent, The Greatest
The greatness of Allah has no boundaries, it has no beginning and end.
There is no similarity to His essence and greatness, and no one is able to fully comprehend them, for this is beyond the capabilities of the mind of creations.
34 / 99
"""



let AlGhafur =
"""
The Merciful, The Forgiving a lot
This name means that Allah hides the sins of people and covers their shortcomings in large numbers, and then, by His mercy, forgives them.
35 / 99
"""


let AshShakur =
"""
The Grateful, The Most Rewarder
Allah rewards His slaves more than they deserve. He is Grateful, therefore generously bestows blessings on people even for their small good deeds.
Allah is the Rewarder of those who serve Him with sincerity in their hearts.
36 / 99
"""


let AlAliyy =
"""
The Most High, Exalted
Allah is the One Whose greatness is incomprehensibly high, has no boundaries. There is no one or anything equal to Him, the existence of rivals and partners for Him is impossible.
37 / 99
"""



let AlKabir =
"""
The Great
This name means that Allah is the Majestic, the Greatest and before Him everything is insignificant.
True greatness describes His essence and deeds. At the same time, His greatness cannot be understood in full measure, since the minds of the created are not able to do this.
He has no equal, He does not need anything, no one can weaken Him in any way. He is beyond having the properties of creations.
38 / 99
"""


let AlHafiz =
"""
The Preserving, The Watching
Allah protects all things in a perfect way, including the smallest particles. And also His creations according to His will. And He watches over all their deeds, keeping them to one.
39 / 99
"""


let AlMuqit =
"""
The Nourisher, The Feeder
Allah is the One Who creates material and spiritual wealth. He is supportive and helpful. Allah endows His creations with everything necessary for their existence in such quantity as is required.
40 / 99
"""


let AlHasib =
"""
The Considering, The Taking Account, The Sufficient
This name means that Allah considers and takes into account absolutely everything. He requires an account of the deeds of His slaves on the Day of Judgment for every lived moment.
Also, this name indicates that He is Sufficient for His servants and for everyone who trusts in Him to achieve blessings and sustenance.
41 / 99
"""


let AlJalil =
"""
The Majestic
This name means that Allah has true greatness that no one else has. His greatness has no boundaries, no beginning and no end. His greatness concerns both attributes and His qualities. He is Holy and Pure from all imperfections.
42 / 99
"""


let AlKarim =
"""
The Most Generous, The Magnanimous, The Most
Retributive
The generosity of Allah knows no measure, because it is so huge that it cannot be counted or somehow measured. He endows with countless benefits His creations, Allah helps those who are in trouble.
He is Pure from everything that is unworthy of His greatness. For His every deed deserves the highest praise.
43 / 99
"""


let ArRaqib =
"""
The Observing, The Watching
Allah watches over all His creations, not missing anyone or anything, even if it is the smallest particle possible. He not only observes, but and keeps everything under absolute control.
There is nothing and no one who would not be under His supervision. His knowledge is perfect, He does not forget or neglect.
44 / 99
"""



let AlMujib =
"""
The Responsive, The Accepting Prayers and Requests
Allah is the only One worth asking and Who should be contacted. He is the Answerer and Helper of His slaves when they ask for help.
Also, this name means that Allah and the One Who bestows blessings on people, if they have not yet had time to turn or have not felt the need to ask for help.
45 / 99
"""


let AIWasi =
"""
The Comprehensive, The Wide
This name means that Allah embraces all His creatures with the widest mercy and encompasses all things with His all-encompassing knowledge.
46 / 99
"""


let AlHakim =
"""
The Wise
This name means that all actions and decisions of Allah are full of justice, correctness and wisdom.
After all, He does everything according to great wisdom, which no one is able to comprehend in full of His creations.
He knows the inner content, in other words the essence of all things.
47 / 99
"""


let AlWadud =
"""
The Loving, The Beloved
Allah loves His believing slaves, and He is also loved by the hearts of His closest slaves - awliya. He wants the best for everyone.
48 / 99
"""


let AlMajeed =
"""
The Glorious, The Most Honorable
Allah is the Possessor of infinitely high dignity and nobility. His attributes are perfect and beautiful, He has the highest position and greatness.
This name is similar to the name - "Al-Maajid" name No. 66, which means: "The Most Glorious, The Noble".
49 / 99
"""


let AlBais =
"""
The Resurrecting, The Sender of help
Al-Ba'is ("The
This name means that Allah will resurrect every single one during the Day of Judgment.
Also one of the meanings is that He is the Sender of messengers and help to His servants.
50 / 99
"""



let AshShahid =
"""
The Witness, The Present
This name means that Allah is the One Who watches over everything that happens. And He is the Witness of any event that happens, regardless of the big or they are small.
This name also means that Allah is present at every event. Nothing can be hidden from Him.
51 / 99
"""


let AlHaqa =
"""
The Truth, The True, The Fair
Allah is truly True, Whose existence is immutable. He reveals and explains the truth. Allah is the Affirmer of what is right and just.
52 / 99
"""


let AlWakil =
"""
The Trusted, The Protector
This name of Allah means that He is Sufficient for those who trust and rely only on Him. At His disposal are the affairs of all things.
His patronage and guarantee are considered sufficient. For He settles all the affairs of His servants when they call upon Him.
53 / 99
"""


let AlQawiyy =
"""
The Almighty, The Mighty
Allah has such power, above which it simply does not exist and He has perfect power over everything created. He is not covered by fatigue from anything.
His power and strength does not decrease from the creation of something or from their destruction.
54 / 99
"""


let AlMatin =
"""
The Unshakable, The Indestructible
Allah is the Possessor of great strength, unfathomable stamina and strength. He is Invincible and does not need help or means to carry out His decisions.
55 / 99
"""


let AlWaliyy =
"""
The Patron, The Helper,
The Guardian
This name of Allah means that He is the Guarantor, Protecting the pious. Close friend for worthy of His slaves. Helping those who love Him.
Not to be confused with a very similar name - "Al-Waali", name No. 77, which means: "The Patron, The Protecting Friend, The Friendly Lord".
56/99
"""


let AlHamid =
"""
The All-Praiseworthy
All praise belongs to Allah, He is the owner of true praise because of His perfection.
Allah is to be praised and thanked in all cases. After all, all His creations praise Him in different languages.
57 / 99
"""


let AlMuhsi =
"""
The Accounter, The Numberer of All
This name of Allah means that He takes into account absolutely everything that happens.
He is the Knower of everything. Knowing everything about His creations: essence, properties, characteristics.
58 / 99
"""


let AlMubdi =
"""
The Beginner, The Creator
Allah created everything that exists from the very beginning without an example and prototype. It is He Who begins every creation. He embodied everything created from non-existence.
59 / 99
"""


let AlMuid =
"""
The Returner, The Restorer
This name of Allah means that He is the Returner of all living things to the dead, and then the Returner of the dead to the living on the Day of Judgment, and also He is Recreating that, which is no longer there.
60 / 99
"""


let AlMuhyi =
"""
The Reviving, The Resurrecting,
The Giver of Life
Allah revives the lifeless seed in the womb, instilling the soul in the process of developing the fetus. He revives the dead earth, pouring rain on it and thereby thus growing on it food for living beings.In the same way, Allah will resurrect all the creatures created by Him, which will be dead at that time.
61 / 99
"""


let AlMumit =
"""
The Bringer of Death
This name of Allah means that He prescribed death for all His creations and it will come sooner or later for everyone. Allah is the only one who actually kills.
62 / 99
"""


let AlHayy =
"""
The Living, The Eternally Living
Allah was alive and will be, His life has no beginning and no end. His life is unlike any of His creations. He does not die, does not get sick, does not grieve and does not sleep.
63 / 99
"""


let AlQayyum =
"""
The Independent, The Almighty
Allah is Independent of anyone or anything, He does not need anything, but at the same time everyone depends and needs Him. He exists by Himself, His existence has neither beginning nor end.
He sustains the life of every creature, through whom everything exists. He controls absolutely every phenomenon, bringing them to life.
64 / 99
"""


let AlWajid =
"""
The Wealthy, The Self-Sufficient
This name of Allah means that for Him there is no concept of insufficiency.
Allah is able to create whatever He wishes. He does not need anything or anyone.
Also, this name can mean that Allah finds everything He wants and no one is able to prevent Him from doing so.
65 / 99
"""


let AlMaajid =
"""
The Most Glorious, The Noble
Allah has wonderful majesty and nobility. He shows generosity and mercy towards His slaves. His attributes and deeds are perfect, great.
66 / 99
"""


let AlWahid =
"""
The Unique, The Single
This name of Allah means that He is Indivisible, One of a kind, there is no one and nothing like Him. He does not and cannot have partners.
67 / 99
"""



let AsSamad =
"""
The Eternal, The Absolute, The Self-Sufficient
Allah does not need anything or anyone, but everyone needs Him.
Nothing happens without His knowledge. He is Eternal, has always been and will be, even after the destruction of all creation.
68 / 99
"""


let AlQadir =
"""
The All-Powerful, Capable
This name of Allah means that He is able to do whatever He wants. Allah is the Possessor of all-comprehensive Power. He does not need training, a tool or an intermediary to achieve what He wants.
69 / 99
"""


let AlMuqtadir =
"""
The Determiner, The Dominant
Allah has unlimited power, which no one can prevent. In His ability to do whatever He wants.
Who arranges the affairs of His creatures in the best way, since no one is able to do this except Him.
70 / 99
"""


let AlMuqaddim =
"""
Pushing forward, Bringing closer
Al-Muqaddim (
This name of Allah means that He pushes forward whom He wants and what He wants. And also pushes forward His worthy slaves and everything that should be.
He determines for each creation its time and position.
71 / 99
"""


let AlMuakhkhir =
"""
The Delayer, He Who Puts
Far Away
This name of Allah means that He pushes back whomever He wants and what He wants. And also pushes back those who, by His will, should be pushed back. He pushes back the unbelievers. He determines for each creation its time and position.
72 / 99
"""


let AlAwwal =
"""
The First, The Beginningless
Allah is the First, in the sense that it precedes everything created. His existence has no beginning. Nothing of the created was before Him.
73 / 99
"""


let AlAkhir =
"""
The Last, The Endless
Allah is the Last, in the sense that He will remain after the destruction of everything He created. There is no end to His existence.
74 / 99
"""


let AzZahir =
"""
The Manifest, The Evident,
The Outer
The existence of Allah is obvious, clear and frank. Everything created points to Him.
75 / 99
"""


let AlBatin =
"""
The Hidden, Intangible
Allah is Hidden in this world from His creations, but at the same time, all created things point to His existence. He does not give in to the image in the minds of people.
76 / 99
"""


let AIWaali =
"""
The Patron, The Protecting Friend,
The Friendly Lord
This name of Allah means that He rules over all things. His decisions are always and everywhere valid and carried out.
77 / 99
"""


let AlMutaali =
"""
The Supremely Exalted, The Most High
Allah is Free from all flaws, shortcomings and vices, He is Above all this. There is nothing like Him, for He is Above all conceivable and inconceivable.
Exalted by His greatness, power and degree over all the possible qualities of His creations.
78 / 99
"""


let AlBarr =
"""
The Good, The Beneficent, The Source of All Goodness
This name of Allah indicates that He is Doing good for His slaves. He gives out of His mercy to those who ask and to those who do not ask.
79 / 99
"""


let AtTawwab =
"""
The Acceptor of Repentance
This name of Allah indicates that He allows His servants to repent and accepts their repentance if they do it sincerely.
And sincerity in repentance is: stop sinning, regret what you have done, firmly resolve not to return to sin, and if someone's right was hurt, then ask for forgiveness.
80 / 99
"""


let AlMuntaqim =
"""
The Avenger, The Punisher
This name of Allah indicates that He takes revenge on those who did injustice and was disobedient to Him. Allah is the Punisher of those who rejected His will and thereby deserved His wrath.
However, He does not punish, except after notification and numerous warnings, for example, to different peoples through His messengers or Holy Books.
81 / 99
"""


let AlAfuww =
"""
The Pardoner, The Effacer,
The Forgiver
Tthe integral quality of Allah is His broadest indulgence and forgiveness towards His creations.
Absolutely everyone needs His mercy. There is no one who could compare with him in forgiveness. He forgives and has mercy on those who sincerely turn to Him.
82 / 99
"""


let ArRauf =
"""
The Kind, The Pitying, The Compassionate
This name of Allah means that He first forgives and hides the sins of His slaves, and later also endows them with His mercy and blessings, after their repentance.
Allah shows compassion and pity to all creatures in this life, as well as to those who believe in eternal life.
83 / 99
"""



let MalikulMulk =
"""
The Owner of all Sovereignty
Allah is the Only and Absolute Ruler of all things, Who disposes of His possessions as He wishes. His power is unlimited.
If He wants something, there is no one to stop Him.
84 / 99
"""


let ZulJalaliwalIkram =
"""
The Owner, Lord of Majesty and Honour
This name of Allah means that He is the Possessor of absolute majesty, generosity and honor. In a word, He is the Possessor of the best attributes.
Allah shows special mercy to His chosen ones, who honor and exalt Him.
85 / 99
"""


let AlMuqsit =
"""
The Equitable, The Requiter
This name of Allah means that He is the Establisher of a perfect and fair order. His decisions are full of wisdom and justice.
He is the Creator of justice, for He avenges the oppressors for the oppressed.
86 / 99
"""


let AlJami =
"""
The Gatherer, The Unifier
This name of Allah indicates that He must be described solely by the qualities of perfection according to logic.
Allah will gather all His creations, which have long since decayed, into The Day of Judgment, as well as all deeds, leaving no small or great unattended.
87 / 99
"""


let AlGhaniyy =
"""
The Rich, The Independent, The Self-Sufficient
Allah is the Real Possessor of wealth. He does not need anyone or anything, but all creatures need Him.
88/99
"""

let AlMughniyy =
"""
“The Enricher, The Emancipator
This name of Allah means that He Enriches whomever He wants and Gives everything necessary to whomever He desires. He is the One from Whom alone it is worth asking for enrichment.
89 / 99
"""

let AlMani =
"""
The Restraining, The Forbidding
Allah is the Establisher of prohibitions. He also deprives some slaves of their inheritance in order to test them or fence them off from what is bad for them. He does this according to His wisdom and will.
90 / 99
"""



let AdDarr =
"""
The Distressor, The Harmer,
The Afflictor
This name of Allah indicates that without His permission, no one is able to harm anyone. He is the Creator of any harm that happens in this world and in the eternal. Allah is the Destroyer of the kingdoms and peoples of the earth, sending various kinds of disasters and cataclysms on sinners.
91 / 99
"""



let AnNafi =
"""
The Propitious, The Benefactor,
The Source of Good
This name of Allah means that He is the Creator of everything useful and good. Allah - Bringing much benefit to whom He Himself wishes. However, without His permission, no one not able to benefit anyone.
92 / 99
"""



let AnNur =
"""
The Illuminator of the worlds,
The Light
Allah illuminates the heavens and the earth with the radiance of the sun and moon. Allah - Giving light and radiance to persons, minds and hearts pleasing to Him. He clearly shows the radiance the right path and leading to Him.
He will grant to whom He wills the light of iman.
93 / 99
"""


let AlHadi =
"""
The Guide, The Leader
This name of Allah means that He guides whomever He wishes on the right path. He leads His slaves on the path of seeking benefit both in spiritual values and in earthly things.
Allah points out to His servants everything that can benefit them and protect them from harm.
94 / 99
"""


let AlBadi =
"""
The Creater in the best way, The Primal Creator
This name of Allah indicates that He is the Creator of everything that exists without prototype and example, and also from absolute nothing.
And He created everything in the most beautiful way.
95 / 99
"""


let AlBaqi =
"""
The Eternal, The Permanent
The only One Whose existence is eternal. Allah has no beginning and no end, for He is Eternal, Permanent. He is beyond the concepts of time and space.
96 / 99
"""



let AlWaris =
"""
“The Heir, The Inheritor of All
This name of Allah indicates that He is the Inheritor of the world and everything that is in it. Since Allah is Eternal, He Continues to exist, while temporary owners of wealth leave this world and are deprived of all benefits.
All power, property and wealth will remain with Allah after the destruction of all His creations.
97 / 99
"""



let ArRashid =
"""
The Guide to the Right Path
This name of Allah means that He is Above all shortcomings. His decisions are full of wisdom, actions - justice, words - correctness.
He is the Guide to the path of truth.
98 / 99
"""



let AsSabur =
"""
The Patient
Allah is not in a hurry to punish sinners and delays their retribution, either until a time determined by Him, or until repentance is inspired in their hearts, or until their sins are forgiven.
Allah does everything in its own time, He does nothing prematurely.
99 / 99
"""


extension ZikirCounter {
    func setImage(imageName:String, textView: UITextView, imageView: UIImageView){
        switch imageName{
        case "Allah (cc)":
            textView.text = Allah
        case "Ar-Rahman":
            textView.text = ArRahman
        case "Ar-Rahim":
            textView.text = ArRahim
        case "Al-Malik":
            textView.text = AlMalik
        case "Al-Quddus":
            textView.text = AlQuddus
        case "As-Selam":
            textView.text = AsSalam
        case "Al-Mu'Min":
            textView.text = AlMumin
        case "Al-Muhaymin":
            textView.text = AlMuhaymin
        case "Al-'Aziz":
            textView.text = AlAziz
        case "Al-Jabbar":
            textView.text = AlJabbar
        case "AI-Mutakabbir":
            textView.text = AlMutakabbir
        case "Al-Khaliq":
            textView.text = AlKhaliq
        case "Al-Bari'":
            textView.text = AlBari
        case "Al-Musawwir":
            textView.text = AlGhaffar
        case "Al-Ghaffar":
            textView.text = AlMusawwir
        case "Al-Qahhar":
            textView.text = AlQahhar
        case "Al-Wahhab":
            textView.text = AlWahhab
        case "Ar-Razzaq":
            textView.text = ArRazzaq
        case "Al-Fattah":
            textView.text = AlFattah
        case "Al-'Alim":
            textView.text = AlAlim
        case "Al-Qabid":
            textView.text = AlQabid
        case "Al-Basit":
            textView.text = AlBasit
        case "Al-Khafid":
            textView.text = AlKhafid
        case "Ar-Rafı’":
            textView.text = ArRafi
        case "Al-Mu'izz":
            textView.text = AlMuizz
        case "AI-Muzil":
            textView.text = AlMuzil
        case "As-Sami'":
            textView.text = AsSami
        case "Al-Basir":
            textView.text = AlBasir
        case "Al-Hakam":
            textView.text = AlHakam
        case "AI-'AdI":
            textView.text = AlAdI
        case "Al-Latif":
            textView.text = AlLatif
        case "Al-Khabir":
            textView.text = AlKhabir
        case "Al-Halim":
            textView.text = AlHalim
        case "Al-'Azim":
            textView.text = AlAzim
        case "Al-Ghafur":
            textView.text = AlGhafur
        case "Ash-Shakur":
            textView.text = AshShakur
        case "Al-'Aliyy":
            textView.text = AlAliyy
        case "Al-Kabir":
            textView.text = AlKabir
        case "Al-Hafiz":
            textView.text = AlHafiz
        case "Al-Muqit":
            textView.text = AlMuqit
        case "Al-Hasib":
            textView.text = AlHasib
        case "Al-Jalil":
            textView.text = AlJalil
        case "Al-Karim":
            textView.text = AlKarim
        case "Ar-Raqib":
            textView.text = ArRaqib
        case "Al-Mujib":
            textView.text = AlMujib
        case "Al-Wasi":
            textView.text = AIWasi
        case "Al-Hakim":
            textView.text = AlHakim
        case "Al-Wadud":
            textView.text = AlWadud
        case "Al-Majeed":
            textView.text = AlMajeed
        case "Al-Bais":
            textView.text = AlBais
        case "Ash-Shahid":
            textView.text = AshShahid
        case "Al-Haqq":
            textView.text = AlHaqa
        case "Al-Wakil":
            textView.text = AlWakil
        case "Al-Qawiyy":
            textView.text = AlQawiyy
        case "Al-Matin":
            textView.text = AlMatin
        case "Al-Waliyy":
            textView.text = AlWaliyy
        case "Al-Hamid":
            textView.text = AlHamid
        case "Al-Muhsi":
            textView.text = AlMuhsi
        case "Al-Mubdi'":
            textView.text = AlMubdi
        case "Al-Mu'id":
            textView.text = AlMuid
        case "Al-Muhyi":
            textView.text = AlMuhyi
        case "Al-Mumit":
            textView.text = AlMumit
        case "Al-Hayy":
            textView.text = AlHayy
        case "Al-Qayyum":
            textView.text = AlQayyum
        case "Al-Wajid":
            textView.text = AlWajid
        case "Al-Maajid":
            textView.text = AlMaajid
        case "Al-Wahid":
            textView.text = AlWahid
        case "As-Samad":
            textView.text = AsSamad
        case "Al-Qadir":
            textView.text = AlQadir
        case "Al-Muqtadir":
            textView.text = AlMuqtadir
        case "Al-Muqaddim":
            textView.text = AlMuqaddim
        case "Al-Muakhkhir":
            textView.text = AlMuakhkhir
        case "Al-Awwal":
            textView.text = AlAwwal
        case "Al-Akhir":
            textView.text = AlAkhir
        case "Az-Zahir":
            textView.text = AzZahir
        case "Al-Batin":
            textView.text = AlBatin
        case "Al-Waali":
            textView.text = AIWaali
        case "Al-Muta'ali":
            textView.text = AlMutaali
        case "Al-Barr":
            textView.text = AlBarr
        case "At-Tawwab":
            textView.text = AtTawwab
        case "Al-Muntaqim":
            textView.text = AlMuntaqim
        case "AI-Afuww":
            textView.text = AlAfuww
        case "Ar-Rauf":
            textView.text = ArRauf
        case "Malikul-Mulk":
            textView.text = MalikulMulk
        case "Zul-Jalali wal-Ikram":
            textView.text = ZulJalaliwalIkram
        case "Al-Muqsit":
            textView.text = AlMuqsit
        case "Al-Jami'":
            textView.text = AlJami
        case "Al-Ghaniyy":
            textView.text = AlGhaniyy
        case "Al-Mughniyy":
            textView.text = AlMughniyy
        case "Al-Mani'":
            textView.text = AlMani
        case "Ad-Darr":
            textView.text = AdDarr
        case "An-Nafi'":
            textView.text = AnNafi
        case "An-Nur":
            textView.text = AnNur
        case "Al-Hadi":
            textView.text = AlHadi
        case "Al-Badi'":
            textView.text = AlBadi
        case "Al-Baqi":
            textView.text = AlBaqi
        case "Al-Waris":
            textView.text = AlWaris
        case "Ar-Rashid":
            textView.text = ArRashid
        case "As-Sabur":
            textView.text = AsSabur
        case "Salli Ala Muhammed":
            imageView.image = UIImage(named: "101")
        case "Subuhanallah-i Vebihamdihi":
            imageView.image = UIImage(named: "105")
        case "Allahumme Bike Asbahna":
            imageView.image = UIImage(named: "106")
        case "Bismillahillezi La Yedurru":
            imageView.image = UIImage(named: "107")
        case "Allahumme Inni Eselukel":
            imageView.image = UIImage(named: "108")
        case "Emseyna/Emsel Mulki Lillah":
            imageView.image = UIImage(named: "109")
        case "Allahumme Einni Ala Zikrih":
            imageView.image = UIImage(named: "110")
        case "La Ilahe Illa Ente Subhanek":
            imageView.image = UIImage(named: "111")
        case "Allahumme Inneke Afuvvun":
            imageView.image = UIImage(named: "112")
        case "Estafurullah El Azim":
            imageView.image = UIImage(named: "113")
        case "Asbahna/Asbahal Mulki Lillah":
            imageView.image = UIImage(named: "114")
        case "Salatan Tefriciye":
            imageView.image = UIImage(named: "120")
        case "Sekine":
            imageView.image = UIImage(named: "Sekine")
        case "Surah-al Ihlas":
            imageView.image = UIImage(named: "117")
        default:
            textView.text = Allah
        }
        
    }
   
}


