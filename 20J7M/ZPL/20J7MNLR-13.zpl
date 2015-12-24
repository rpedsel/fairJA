set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.9904, <2> 28.2698, <3> 24.2733, <4> 27.2915, <5> 14.9929, <6> 20.7202, <7> 15.347, <8> 26.9022, <9> 28.0965, <10> 33.0102, <11> 18.3171, <12> 20.4513, <13> 34.5779, <14> 35.542, <15> 33.053, <16> 29.052, <17> 21.3034, <18> 26.3749, <19> 30.1864, <20> 23.2206;
param workload[JOB] := <1> 15.3324, <2> 14.7438, <3> 7.6772, <4> 28.3542, <5> 30.9062, <6> 24.7016, <7> 44.6084, <8> 8.6568, <9> 42.3228, <10> 5.5595, <11> 32.12, <12> 44.5299, <13> 17.2712, <14> 10.1638, <15> 23.4632, <16> 3.3717, <17> 29.3977, <18> 15.5538, <19> 17.0657, <20> 28.8196;
param capacity[MACHINE] := <1> 63.5171, <2> 63.5171, <3> 63.5171, <4> 63.5171, <5> 63.5171, <6> 63.5171, <7> 63.5171;

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
