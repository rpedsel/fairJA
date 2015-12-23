set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 3.4665, <2> 48.1871, <3> 23.547, <4> 29.8514, <5> 20.2564, <6> 37.9677, <7> 30.1647, <8> 21.1987, <9> 20.5541, <10> 21.5502, <11> 6.9285, <12> 34.3096, <13> 44.9378, <14> 35.3609, <15> 34.9494, <16> 18.5362, <17> 20.075, <18> 5.9289, <19> 43.9734, <20> 26.9555;
param workload[JOB] := <1> 1.8619, <2> 6.9417, <3> 4.8525, <4> 5.4636, <5> 4.5007, <6> 6.1618, <7> 5.4922, <8> 4.6042, <9> 4.5337, <10> 4.6422, <11> 2.6322, <12> 5.8574, <13> 6.7036, <14> 5.9465, <15> 5.9118, <16> 4.3054, <17> 4.4805, <18> 2.4349, <19> 6.6312, <20> 5.1919;
param capacity[MACHINE] := <1> 10.6232, <2> 10.6232, <3> 10.6232, <4> 10.6232, <5> 10.6232, <6> 10.6232, <7> 10.6232;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
