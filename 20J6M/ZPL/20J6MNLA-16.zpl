set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.507, <2> 26.2168, <3> 27.4594, <4> 20.1567, <5> 18.3255, <6> 19.0528, <7> 34.4527, <8> 20.5476, <9> 19.6818, <10> 24.6239, <11> 25.9586, <12> 31.6292, <13> 27.2201, <14> 25.734, <15> 30.8242, <16> 29.0439, <17> 30.071, <18> 23.9841, <19> 17.4931, <20> 32.6686;
param workload[JOB] := <1> 600.593, <2> 687.3206, <3> 754.0186, <4> 406.2926, <5> 335.824, <6> 363.0092, <7> 1186.9885, <8> 422.2039, <9> 387.3733, <10> 606.3365, <11> 673.8489, <12> 1000.4063, <13> 740.9338, <14> 662.2388, <15> 950.1313, <16> 843.5481, <17> 904.265, <18> 575.2371, <19> 306.0085, <20> 1067.2374;
param capacity[MACHINE] := <1> 2245.6359, <2> 2245.6359, <3> 2245.6359, <4> 2245.6359, <5> 2245.6359, <6> 2245.6359;

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
