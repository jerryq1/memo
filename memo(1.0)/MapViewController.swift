//
//  MapViewController.swift
//  memo(1.0)
//
//  Created by jerry on 16/12/22.
//  Copyright © 2016年 jerry. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var restaurant:Restaurant!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsBuildings = true
        mapView.showsCompass = true
        mapView.showsScale = true
        mapView.showsTraffic = true
        mapView.showsUserLocation = true
        
        
      
        //将地址转换为坐标，如果转换错误即日志输出error
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(restaurant.location!) { (placemarks, error) -> Void in
            if error != nil{
                print(error)
                return
            }
            
            //如果转换成功，那么将得出的坐标数组取第一个(placemarks[0])命名为placemark
            if let placemarks = placemarks{
                let placemark = placemarks[0]
                
                //annotation标注
                let annotation = MKPointAnnotation()
                annotation.title = self.restaurant.name
                annotation.subtitle = self.restaurant.type
                
                //把取出来坐标的地址赋予标注，然后在mapView中显示出来
                if let location = placemark.location{
                    annotation.coordinate = location.coordinate
                    
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            }
        }
        // Do any additional setup after loading the view.
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let id = "我的图钉"
        
        //用户位置视图也是一个标注视图，排除对其的定制
        if annotation is MKUserLocation{
            return nil
        }
        
        //为性能考虑，重用一个已存在的标注视图
        var annotationView = self.mapView.dequeueReusableAnnotationViewWithIdentifier(id) as? MKPinAnnotationView
        
        //如果没有可重用的就初始化一个标注视图，并启用气球提示
        if annotationView == nil{
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: id)
                annotationView?.canShowCallout = true
        }
        
        //添加一个缩略图到标注视图中(restaurant.image是我个人运用的视图)
        let leftIconView = UIImageView(frame: CGRectMake(0, 0, 53, 53))
        leftIconView.image = UIImage(data: restaurant.photo!)
        annotationView?.leftCalloutAccessoryView = leftIconView
        
        return annotationView
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
