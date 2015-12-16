set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 46.8121, <2> 41.2336, <3> 44.7241, <4> 22.4543, <5> 18.2785, <6> 11.5174, <7> 38.3481, <8> 34.0281, <9> 33.0414, <10> 30.9513, <11> 34.0257, <12> 11.9119, <13> 44.8421, <14> 21.7271, <15> 27.5749, <16> 14.5275, <17> 48.031, <18> 18.8566, <19> 18.0955, <20> 44.4123;
param workload[JOB] := <1> 19.9096, <2> 31.0188, <3> 40.7471, <4> 45.445, <5> 47.3841, <6> 0.9373, <7> 4.7805, <8> 4.5949, <9> 47.811, <10> 47.7595, <11> 2.9535, <12> 11.5567, <13> 24.566, <14> 38.962, <15> 10.1147, <16> 18.9126, <17> 2.2532, <18> 19.6161, <19> 14.649, <20> 1.283;
param capacity[MACHINE] := <1> 435.2546, <2> 435.2546, <3> 435.2546, <4> 435.2546, <5> 435.2546, <6> 435.2546;

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
