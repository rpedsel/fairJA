set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.8947, <2> 23.7954, <3> 22.9403, <4> 22.9218, <5> 20.1261, <6> 34.1632, <7> 31.6425, <8> 27.238, <9> 21.74, <10> 27.3271, <11> 27.8671, <12> 26.3922, <13> 19.8845, <14> 22.0553, <15> 21.1638, <16> 30.8502, <17> 18.2911, <18> 35.3865, <19> 15.0329, <20> 28.6695;
param workload[JOB] := <1> 26.8947, <2> 23.7954, <3> 22.9403, <4> 22.9218, <5> 20.1261, <6> 34.1632, <7> 31.6425, <8> 27.238, <9> 21.74, <10> 27.3271, <11> 27.8671, <12> 26.3922, <13> 19.8845, <14> 22.0553, <15> 21.1638, <16> 30.8502, <17> 18.2911, <18> 35.3865, <19> 15.0329, <20> 28.6695;
param capacity[MACHINE] := <1> 84.0637, <2> 84.0637, <3> 84.0637, <4> 84.0637, <5> 84.0637, <6> 84.0637;

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
