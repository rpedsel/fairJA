set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.813, <2> 24.18, <3> 22.6601, <4> 17.431, <5> 27.3758, <6> 26.3725, <7> 17.0175, <8> 28.6437, <9> 31.5096, <10> 20.7276, <11> 21.3055, <12> 27.3715, <13> 23.615, <14> 29.1928, <15> 30.4382, <16> 25.0693, <17> 20.4515, <18> 19.0185, <19> 24.704, <20> 23.2021;
param workload[JOB] := <1> 5.6403, <2> 4.9173, <3> 4.7603, <4> 4.175, <5> 5.2322, <6> 5.1354, <7> 4.1252, <8> 5.352, <9> 5.6133, <10> 4.5528, <11> 4.6158, <12> 5.2318, <13> 4.8595, <14> 5.403, <15> 5.5171, <16> 5.0069, <17> 4.5223, <18> 4.361, <19> 4.9703, <20> 4.8169;
param capacity[MACHINE] := <1> 10.5866, <2> 10.5866, <3> 10.5866, <4> 10.5866, <5> 10.5866, <6> 10.5866, <7> 10.5866;

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
