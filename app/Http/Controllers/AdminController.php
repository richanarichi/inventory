<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Support\Facades\Hash;


class AdminController extends Controller
{
    public function destroy(Request $request)
    {
        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        $notification = array(
            'message' => 'User Logged Out Successfully', 
            'alert-type' => 'success'
        );

        return redirect('/login')->with($notification);

        return redirect('/login');
    }


    public function Profile(){
        $id = Auth::user()->id;
        $admindata = User::find($id);
        return view('admin.admin_profile_view', compact('admindata'));
    }

    public function EditProfile(){
        $id = Auth::user()->id;
        $editdata = User::find($id);
        return view('admin.admin_profile_edit', compact('editdata'));
    }
    public function StoreProfile(Request $request){
        $id = Auth::user()->id;
        $data = User::find($id);
        $data->name =$request->name;
        $data->email =$request->email;
        $data->username =$request->username;

        if ($request->file('profile_image')){
            $file = $request->file('profile_image');

            $filename = date('YmdHi').$file->getClientOriginalName();
            $file->move(public_path('upload/admin_images'),$filename);
            $data['profile_image']=$filename;
        }
        $data->save();
        
        $notification = array(
            'message' => 'Admin Profile Updated Successfully', 
            'alert-type' => 'info'
        );

        return redirect()->route('admin.profile')->with($notification);
    }

    public function ChangePassword(){

        return view('admin.admin_change_password');

    }// End Method


    public function UpdatePassword(Request $request){
        $validateData = $request->validate([
            'oldpassword' => 'required',
            'new_password' => 'required',
            'confirm_password' => 'required|same:new_password',

        ]);

        $hashPassword = Auth::user()->password;
        if (Hash::check($request->oldpassword,$hashPassword )) {
            $users = User::find(Auth::id());
            $users->password = bcrypt($request->new_password);
            $users->save();

            session()->flash('message','Password Updated Successfully');
            return redirect()->back();
        } else{
            session()->flash('message','Old password does not match');
            return redirect()->back();
        } 
    }// End Method

    public function AdminIndex(){

        return view('admin.index');

    }// End Method

}
