<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use App\Models\Post;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    // Relation
    public function isRelated(User $user){
        if (auth()->user()->id === $user->id) {
            return true;
        }

        return $this->from()->where('to_id', $user->id)->exists() || $this->to()->where('from_id', $user->id)->exists();
    }

    public function posts() {
        return $this->hasMany(Post::class);
    }

    public function from(){
        return $this->belongsToMany(User::class, 'friends', 'from_id', 'to_id');
    }

    public function to(){
        return $this->belongsToMany(User::class, 'friends', 'to_id', 'from_id');
    }

    // Friends
    public function friends(){
        return $this->friendsFrom->merge($this->friendsTo);
    }

    public function friendsFrom(){
        return $this->from()->wherePivot('accepted', true);
    }

    public function friendsTo(){
        return $this->to()->wherePivot('accepted', true);
    }

    // Friends pending
    public function pendingFrom(){
        return $this->from()->wherePivot('accepted', false);
    }

    public function pendingTo(){
        return $this->to()->wherePivot('accepted', false);
    }
}
