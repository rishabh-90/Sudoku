//
//  ViewController.swift
//  Assignment
//
//  Created by Rishabh Aggarwal on 2016-10-05.
//  Copyright © 2016 Default Profile. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,
                        UICollectionViewDataSource,
                        UICollectionViewDelegate,
                        UICollectionViewDelegateFlowLayout
{
    var row: Int = 0
    var column: Int = 0
    var IsSecondPuzzle : Bool = false
    private let sectionInsets = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    @IBOutlet weak var collectionView: UICollectionView!
    var pastrow: Int = 0
    var pastcolumn: Int = 0
    var data = DataModel(numItemsPerRow: 9, initialization: 0)
    var audioplayer = AVAudioPlayer()
    var timer = NSTimer()
    @IBOutlet weak var Minutetime: UILabel!
    @IBOutlet weak var Time: UILabel!
    var counter = 0
    var mintime = 00
    var state = 1

    
    private let itemsPerRow = 9
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.25, target:self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)

        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // how many items you want to show in its grid
    func collectionView(collectionView: UICollectionView,  numberOfItemsInSection section: Int) -> Int {
        return itemsPerRow*itemsPerRow
    }
    
    
    
    // create data
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("DataCell", forIndexPath: indexPath) as! SudokuCollectionViewCell
        var row, column : Int
        //var ref: Int = 0
        (row, column) = getlocation(indexPath)
        
       cell.backgroundColor = UIColor.blueColor()
        cell.label.text = String(data.get_num(row, column: column))
            if cell.label.text == "0"
            {
            cell.label.hidden = true
            cell.backgroundColor = UIColor.blackColor()
            }
            else
            {
            cell.label.hidden = false
            }
        return cell
    }
    
    
    // specify cell size
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let paddingSpace = Int(sectionInsets.left) * itemsPerRow * 2
        let availableWidth = view.frame.width - CGFloat(paddingSpace)
        let widthPerItem = availableWidth / CGFloat(itemsPerRow)
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    //****to highlight the selected block ***/
    
   func collectionView(collectionView: UICollectionView, didDeSelectItemAtIndexPath indexPath: NSIndexPath) {
        // You can use indexPath to get "cell number x", or get the cell like:
        //let cell = collectionView.cellForItemAtIndexPath(indexPath) as! SudokuCollectionViewCell
        (row, column) = getlocation(indexPath)
        
        // update model
        collectionView.reloadData() // update view
    }

 

    
   // selection behaviour
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // You can use indexPath to get "cell number x", or get the cell like:
        //let cell = collectionView.cellForItemAtIndexPath(indexPath) as! SudokuCollectionViewCell
        (row, column) = getlocation(indexPath)
        pastrow = row
        pastcolumn = column
         // update model
        
    }
    
    func getlocation(indexPath: NSIndexPath) -> (row: Int, column: Int) {
        let row: Int = indexPath.row / itemsPerRow
        let column: Int = indexPath.row % itemsPerRow
        return (row, column)
    }
    func update(){
        
        Time.text = String(counter++)
        
        
        if counter == 60 {
            mintime += 1
            Minutetime.text = String( mintime)
            counter = 0
            
        }
        if mintime < 9
        {
            Minutetime.text = "0" + String( mintime)
        }
        //self.viewDidLoad()
        
    }

    
    @IBAction func click1(sender: AnyObject) {
       
        
        if IsSecondPuzzle == true
        {
            if data.secondenabled[row][column] == true
            {
                data.set_num(row, column: column, value: 1)
            }
        }
        else if IsSecondPuzzle == false
        {
            if data.questionenabled[row][column] == true
            {
                data.set_num(row, column: column, value: 1)
            }
        }
        collectionView.reloadData()
        var alertsound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("button1", ofType: "mp3")!)
        var error: NSError?
        //audioplayer = AVAudioPlayer(contentsOfURL: alertsound, error: &error)
        do
        {
            audioplayer = try AVAudioPlayer(contentsOfURL: alertsound, fileTypeHint: nil)
            audioplayer.play()
        }
        catch
        {
            
        }

        
    }
    
    @IBAction func click2(sender: AnyObject) {
        
        
        if IsSecondPuzzle == true
        {
            if data.secondenabled[row][column] == true
            {
                data.set_num(row, column: column, value: 2)
            }
        }
        else if IsSecondPuzzle == false
        {
            if data.questionenabled[row][column] == true
            {
                data.set_num(row, column: column, value: 2)
            }
        }
        collectionView.reloadData()
        var alertsound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("button1", ofType: "mp3")!)
        var error: NSError?
        //audioplayer = AVAudioPlayer(contentsOfURL: alertsound, error: &error)
        do
        {
            audioplayer = try AVAudioPlayer(contentsOfURL: alertsound, fileTypeHint: nil)
            audioplayer.play()
        }
        catch
        {
            
        }
    }
    
    @IBAction func click3(sender: AnyObject) {
        
        if IsSecondPuzzle == true
        {
            if data.secondenabled[row][column] == true
            {
                data.set_num(row, column: column, value: 3)
            }
        }
        else if IsSecondPuzzle == false
        {
            if data.questionenabled[row][column] == true
            {
                data.set_num(row, column: column, value: 3)
            }
        }
        collectionView.reloadData()
        var alertsound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("button1", ofType: "mp3")!)
        var error: NSError?
        //audioplayer = AVAudioPlayer(contentsOfURL: alertsound, error: &error)
        do
        {
            audioplayer = try AVAudioPlayer(contentsOfURL: alertsound, fileTypeHint: nil)
            audioplayer.play()
        }
        catch
        {
            
        }
    }
    
    @IBAction func click4(sender: AnyObject) {
        if IsSecondPuzzle == true
        {
            if data.secondenabled[row][column] == true
            {
                data.set_num(row, column: column, value: 4)
            }
        }
        else if IsSecondPuzzle == false
        {
            if data.questionenabled[row][column] == true
            {
                data.set_num(row, column: column, value: 4)
            }
        }
        collectionView.reloadData()
        var alertsound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("button1", ofType: "mp3")!)
        var error: NSError?
        //audioplayer = AVAudioPlayer(contentsOfURL: alertsound, error: &error)
        do
        {
            audioplayer = try AVAudioPlayer(contentsOfURL: alertsound, fileTypeHint: nil)
            audioplayer.play()
        }
        catch
        {
            
        }
    }
    
    @IBAction func click5(sender: AnyObject) {
        
        if IsSecondPuzzle == true
        {
            if data.secondenabled[row][column] == true
            {
                data.set_num(row, column: column, value: 5)
            }
        }
        else if IsSecondPuzzle == false
        {
            if data.questionenabled[row][column] == true
            {
                data.set_num(row, column: column, value: 5)
            }
        }
        collectionView.reloadData()
        var alertsound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("button1", ofType: "mp3")!)
        var error: NSError?
        //audioplayer = AVAudioPlayer(contentsOfURL: alertsound, error: &error)
        do
        {
            audioplayer = try AVAudioPlayer(contentsOfURL: alertsound, fileTypeHint: nil)
            audioplayer.play()
        }
        catch
        {
            
        }
    }
    
    
    @IBAction func click6(sender: AnyObject) {
        
        if IsSecondPuzzle == true
        {
            if data.secondenabled[row][column] == true
            {
                data.set_num(row, column: column, value: 6)
            }
        }
        else if IsSecondPuzzle == false
        {
            if data.questionenabled[row][column] == true
            {
                data.set_num(row, column: column, value: 6)
            }
        }
        collectionView.reloadData()
        var alertsound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("button1", ofType: "mp3")!)
        var error: NSError?
        //audioplayer = AVAudioPlayer(contentsOfURL: alertsound, error: &error)
        do
        {
            audioplayer = try AVAudioPlayer(contentsOfURL: alertsound, fileTypeHint: nil)
            audioplayer.play()
        }
        catch
        {
            
        }
    }
    
    @IBAction func click7(sender: AnyObject) {
        
        if IsSecondPuzzle == true
        {
            if data.secondenabled[row][column] == true
            {
                data.set_num(row, column: column, value: 7)
            }
        }
        else if IsSecondPuzzle == false
        {
            if data.questionenabled[row][column] == true
            {
                data.set_num(row, column: column, value: 7)
            }
        }
        collectionView.reloadData()
        var alertsound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("button1", ofType: "mp3")!)
        var error: NSError?
        //audioplayer = AVAudioPlayer(contentsOfURL: alertsound, error: &error)
        do
        {
            audioplayer = try AVAudioPlayer(contentsOfURL: alertsound, fileTypeHint: nil)
            audioplayer.play()
        }
        catch
        {
            
        }
    }
    
    @IBAction func click8(sender: AnyObject) {
        
        if IsSecondPuzzle == true
        {
            if data.secondenabled[row][column] == true
            {
                data.set_num(row, column: column, value: 8)
            }
        }
        else if IsSecondPuzzle == false
        {
            if data.questionenabled[row][column] == true
            {
                data.set_num(row, column: column, value: 8)
            }
        }
        collectionView.reloadData()
        var alertsound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("button1", ofType: "mp3")!)
        var error: NSError?
        //audioplayer = AVAudioPlayer(contentsOfURL: alertsound, error: &error)
        do
        {
            audioplayer = try AVAudioPlayer(contentsOfURL: alertsound, fileTypeHint: nil)
            audioplayer.play()
        }
        catch
        {
            
        }
    }
    
    
    
    @IBAction func click9(sender: AnyObject) {
        
        if IsSecondPuzzle == true
        {
            if data.secondenabled[row][column] == true
            {
                data.set_num(row, column: column, value: 9)
            }
        }
        else if IsSecondPuzzle == false
        {
            if data.questionenabled[row][column] == true
            {
                data.set_num(row, column: column, value: 9)
            }
        }
        collectionView.reloadData()
        var alertsound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("button1", ofType: "mp3")!)
        var error: NSError?
        //audioplayer = AVAudioPlayer(contentsOfURL: alertsound, error: &error)
        do
        {
            audioplayer = try AVAudioPlayer(contentsOfURL: alertsound, fileTypeHint: nil)
            audioplayer.play()
        }
        catch
        {
            
        }
    }
    
    
    
    //@IBAction func sortClicked(sender: AnyObject)
   // {
     //   data.sortButton()
       // collectionView.reloadData()
    
    //}
    
    @IBAction func ShowAnswer(sender: UIButton)
    {
        if IsSecondPuzzle == false
        {
            data.question1 = data.answer
            collectionView.reloadData()
            timer.invalidate()
        }
        else
        {
            data.question1 = data.answer2
            collectionView.reloadData()
            timer.invalidate()
        }
    }
    
    @IBAction func CheckAnswer(sender: UIButton)
    {
        
        if(data.question1 == data.answer){
            
            if IsSecondPuzzle == false {
                
                let alertController = UIAlertController(title: "SUDOKU", message:
                    
                    "Correct", preferredStyle: UIAlertControllerStyle.Alert)
                
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                
                
                
                self.presentViewController(alertController, animated: true, completion: nil)
                var alertsound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("win", ofType: "mp3")!)
                var error: NSError?
                //audioplayer = AVAudioPlayer(contentsOfURL: alertsound, error: &error)
                do
                {
                    audioplayer = try AVAudioPlayer(contentsOfURL: alertsound, fileTypeHint: nil)
                    audioplayer.play()
                }
                catch
                {
                    
                }
                data.Question()
                collectionView.reloadData()
                
            }
            
        }
            
        else{
            
            if IsSecondPuzzle == false{
                
                let alertController = UIAlertController(title: "SUDOKU", message:
                    
                    "Incorrect", preferredStyle: UIAlertControllerStyle.Alert)
                
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                
                
                
                self.presentViewController(alertController, animated: true, completion: nil)
                var alertsound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("fail", ofType: "mp3")!)
                var error: NSError?
                //audioplayer = AVAudioPlayer(contentsOfURL: alertsound, error: &error)
                do
                {
                    audioplayer = try AVAudioPlayer(contentsOfURL: alertsound, fileTypeHint: nil)
                    audioplayer.play()
                }
                catch
                {
                    
                }

                
            }
            
        }
        
        if(data.question1 == data.answer2){
            
            if IsSecondPuzzle == true{
                
                let alertController = UIAlertController(title: "SUDOKU", message:
                    
                    "Correct", preferredStyle: UIAlertControllerStyle.Alert)
                
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                
                
                
                self.presentViewController(alertController, animated: true, completion: nil)
                var alertsound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("win", ofType: "mp3")!)
                var error: NSError?
                //audioplayer = AVAudioPlayer(contentsOfURL: alertsound, error: &error)
                do
                {
                    audioplayer = try AVAudioPlayer(contentsOfURL: alertsound, fileTypeHint: nil)
                    audioplayer.play()
                }
                catch
                {
                    
                }
                data.Question()
                collectionView.reloadData()
                
            }
            
        }
            
        else{
            
            if IsSecondPuzzle == true {
                
                let alertController = UIAlertController(title: "SUDOKU", message:
                    
                    "Incorrect", preferredStyle: UIAlertControllerStyle.Alert)
                
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                
                
                
                self.presentViewController(alertController, animated: true, completion: nil)
                var alertsound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("fail", ofType: "mp3")!)
                var error: NSError?
                //audioplayer = AVAudioPlayer(contentsOfURL: alertsound, error: &error)
                do
                {
                    audioplayer = try AVAudioPlayer(contentsOfURL: alertsound, fileTypeHint: nil)
                    audioplayer.play()
                }
                catch
                {
                    
                }

                
            }
            
        }
        
        timer.invalidate()
        counter = 0
        mintime = 0
        Minutetime.text = String( mintime)
        Time.text = String(counter)
        timer = NSTimer.scheduledTimerWithTimeInterval(0.25, target:self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
        
    }

    @IBAction func NextPuzzle(sender: UIButton)
    {
        data.question1 = data.question2
        collectionView.reloadData()
        if IsSecondPuzzle == false
        {
            IsSecondPuzzle = true
            var disableMyButton = sender as? UIButton
            disableMyButton!.enabled = false
            timer.invalidate()
            counter = 0
            mintime = 0
            Minutetime.text = String( mintime)
            Time.text = String(counter)
            timer = NSTimer.scheduledTimerWithTimeInterval(0.25, target:self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
            
            
            
        }
        else
        {
            //button disabled
            var disableMyButton = sender as? UIButton
            disableMyButton!.enabled = false
        }
        
    }
    
  
    @IBAction func Reset(sender: AnyObject) {
        
        data.Question()
        collectionView.reloadData()
        timer.invalidate()
        counter = 0
        mintime = 0
        Minutetime.text = String( mintime)
        Time.text = String(counter)
        timer = NSTimer.scheduledTimerWithTimeInterval(0.25, target:self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
    }
    
    @IBAction func Undo(sender: AnyObject) {
        
        data.set_num(row, column: column, value: 0)
        collectionView.reloadData()
        var alertsound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("undo", ofType: "mp3")!)
        var error: NSError?
        //audioplayer = AVAudioPlayer(contentsOfURL: alertsound, error: &error)
        do
        {
            audioplayer = try AVAudioPlayer(contentsOfURL: alertsound, fileTypeHint: nil)
            audioplayer.play()
        }
        catch
        {
            
        }

    }
    
    
    
}





