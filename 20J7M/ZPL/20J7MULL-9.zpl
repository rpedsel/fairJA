set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.3197, <2> 1.3612, <3> 9.0735, <4> 36.2734, <5> 14.1834, <6> 36.3869, <7> 22.438, <8> 28.3431, <9> 30.8294, <10> 18.9949, <11> 14.6362, <12> 30.4256, <13> 36.8308, <14> 14.9733, <15> 49.4007, <16> 27.028, <17> 15.7643, <18> 42.822, <19> 14.7841, <20> 43.6682;
param workload[JOB] := <1> 34.3197, <2> 1.3612, <3> 9.0735, <4> 36.2734, <5> 14.1834, <6> 36.3869, <7> 22.438, <8> 28.3431, <9> 30.8294, <10> 18.9949, <11> 14.6362, <12> 30.4256, <13> 36.8308, <14> 14.9733, <15> 49.4007, <16> 27.028, <17> 15.7643, <18> 42.822, <19> 14.7841, <20> 43.6682;
param capacity[MACHINE] := <1> 74.6481, <2> 74.6481, <3> 74.6481, <4> 74.6481, <5> 74.6481, <6> 74.6481, <7> 74.6481;

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
