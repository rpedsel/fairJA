set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.3042, <2> 12.3198, <3> 16.3251, <4> 34.7304, <5> 27.965, <6> 29.6113, <7> 20.471, <8> 27.3622, <9> 30.275, <10> 24.2896, <11> 17.6038, <12> 28.1447, <13> 28.1627, <14> 32.1575, <15> 26.1143, <16> 25.4484, <17> 21.2812, <18> 15.9018, <19> 21.3724, <20> 28.8966;
param workload[JOB] := <1> 5.0303, <2> 3.51, <3> 4.0404, <4> 5.8933, <5> 5.2882, <6> 5.4416, <7> 4.5245, <8> 5.2309, <9> 5.5023, <10> 4.9284, <11> 4.1957, <12> 5.3052, <13> 5.3069, <14> 5.6708, <15> 5.1102, <16> 5.0446, <17> 4.6132, <18> 3.9877, <19> 4.623, <20> 5.3756;
param capacity[MACHINE] := <1> 14.089, <2> 14.089, <3> 14.089, <4> 14.089, <5> 14.089, <6> 14.089, <7> 14.089;

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
