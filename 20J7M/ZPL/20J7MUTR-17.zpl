set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 3.9178, <2> 5.0171, <3> 43.1158, <4> 28.4272, <5> 8.4682, <6> 44.5823, <7> 17.4713, <8> 23.3499, <9> 15.1884, <10> 4.7188, <11> 2.9219, <12> 1.197, <13> 40.6492, <14> 43.3842, <15> 9.3638, <16> 35.6062, <17> 25.4131, <18> 16.3106, <19> 37.3276, <20> 49.1286;
param workload[JOB] := <1> 13.7859, <2> 26.2031, <3> 34.4057, <4> 41.1725, <5> 36.4265, <6> 1.7657, <7> 21.4061, <8> 43.5138, <9> 39.9506, <10> 16.5637, <11> 8.5273, <12> 20.5048, <13> 36.8981, <14> 10.0835, <15> 9.667, <16> 38.3518, <17> 15.9787, <18> 46.7579, <19> 33.0171, <20> 22.4115;
param capacity[MACHINE] := <1> 55.4347, <2> 55.4347, <3> 55.4347, <4> 55.4347, <5> 55.4347, <6> 55.4347, <7> 55.4347;

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
