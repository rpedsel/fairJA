set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.3624, <2> 26.6929, <3> 22.5318, <4> 35.1469, <5> 30.4338, <6> 27.3731, <7> 26.6286, <8> 23.5649, <9> 28.0175, <10> 24.5446, <11> 25.2029, <12> 11.9435, <13> 29.8183, <14> 24.2431, <15> 26.3783, <16> 20.9864, <17> 20.4306, <18> 21.7987, <19> 19.9183, <20> 24.7617;
param workload[JOB] := <1> 29.3624, <2> 26.6929, <3> 22.5318, <4> 35.1469, <5> 30.4338, <6> 27.3731, <7> 26.6286, <8> 23.5649, <9> 28.0175, <10> 24.5446, <11> 25.2029, <12> 11.9435, <13> 29.8183, <14> 24.2431, <15> 26.3783, <16> 20.9864, <17> 20.4306, <18> 21.7987, <19> 19.9183, <20> 24.7617;
param capacity[MACHINE] := <1> 83.2964, <2> 83.2964, <3> 83.2964, <4> 83.2964, <5> 83.2964, <6> 83.2964;

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
