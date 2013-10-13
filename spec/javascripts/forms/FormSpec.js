//= require

describe("forms", function() {
  beforeEach(function() {
    error = document.createElement('div');
    error.id = 'errors';
    error.innerHTML = "some error";
    document.body.appendChild(error);
  });

  afterEach(function() {
    document.body.removeChild(error);
  });

  it("should clear errors from the page", function() {
    Forms.clearErrors;
    expect(error.innerHTML).toBeFalsy
  });

  it('should post the error onto the page', function() {
    var error_message = { responseJSON: "another error" };
    Forms.postError('e', error_message);
    expect(error.innerHTML).toEqual("another error");
  })

})





//   var player;
//   var song;

//   beforeEach(function() {
//     player = new Player();
//     song = new Song();
//   });

//   it("should be able to play a Song", function() {
//     player.play(song);
//     expect(player.currentlyPlayingSong).toEqual(song);

//     //demonstrates use of custom matcher
//     expect(player).toBePlaying(song);
//   });

//   describe("when song has been paused", function() {
//     beforeEach(function() {
//       player.play(song);
//       player.pause();
//     });

//     it("should indicate that the song is currently paused", function() {
//       expect(player.isPlaying).toBeFalsy();

//       // demonstrates use of 'not' with a custom matcher
//       expect(player).not.toBePlaying(song);
//     });

//     it("should be possible to resume", function() {
//       player.resume();
//       expect(player.isPlaying).toBeTruthy();
//       expect(player.currentlyPlayingSong).toEqual(song);
//     });
//   });

//   // demonstrates use of spies to intercept and test method calls
//   it("tells the current song if the user has made it a favorite", function() {
//     spyOn(song, 'persistFavoriteStatus');

//     player.play(song);
//     player.makeFavorite();

//     expect(song.persistFavoriteStatus).toHaveBeenCalledWith(true);
//   });

//   //demonstrates use of expected exceptions
//   describe("#resume", function() {
//     it("should throw an exception if song is already playing", function() {
//       player.play(song);

//       expect(function() {
//         player.resume();
//       }).toThrow("song is already playing");
//     });
//   });
// });
